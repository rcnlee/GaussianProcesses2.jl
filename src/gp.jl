"""
    GaussianProcess

Gaussian process.
# Arguments
- `m::MeanFunction`: mean function
- `k::CovarianceFunction`: covariance function
- `X`: design points
- `y`: objective values at design points
- `ν`: noise variance
"""
mutable struct GaussianProcess
    m::MeanFunction         # mean function
    k::CovarianceFunction    # covariance function
    X   # design points
    y   # objective values
    ν   # noise variance
end

"""
    μ(X, m::MeanFunction) 

Compute mean vector by applying mean function to each X.
"""
μ(X, m::MeanFunction) = [m(x) for x in X]
"""
    Σ(X, k::CovarianceFunction) 

Compute covariance matrix by applying kernel to each cartesian product combination of X.
"""
Σ(X, k::CovarianceFunction) = [k(x,x´) for x in X, x´ in X]
"""
    K(X, X´, k::CovarianceFunction) 

Compute covariance matrix by applying kernel to each cartesian product combination of X and X´.
"""
K(X, X´, k) = [k(x,x´) for x in X, x´ in X´]

"""
    predict(GP::GaussianProcess, X_pred::Vector)

Make predictions of mean and variance based on the GP model at points X_pred.
"""
function predict(GP::GaussianProcess, X_pred::Vector)
    m, k, ν = GP.m, GP.k, GP.ν
    tmp = K(X_pred, GP.X, k) / (K(GP.X, GP.X, k) + ν*I)
    μ_pred = μ(X_pred, m) + tmp*(GP.y - μ(GP.X, m))
    S = K(X_pred, X_pred, k) - tmp*K(GP.X, X_pred, k)
    ν_pred = diag(S) .+ eps()  #eps prevents numerical issues
    return (μ_pred, ν_pred)
end
