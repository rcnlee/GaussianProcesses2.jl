abstract type CovarianceFunction end

"""
    SquaredExponential

Squared exponential covariance kernel.
# Arguments
- `l::Float64`: length scale
"""
struct SquaredExponential <: CovarianceFunction
    l²::Float64
    SquaredExponential(l::Float64) = new(l*l)
end

function (k::SquaredExponential)(x, x´)
    r² = (x - x´) * (x - x´)
    exp(-(r²/(2*k.l²)))
end


