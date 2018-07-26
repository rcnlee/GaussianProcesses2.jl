"""
Partial implementation of Gaussian Processes from
Kochenderfer and Wheeler - Algorithms for Optimization
"""
module GaussianProcesses2
# Use GaussianProcesses2 to avoid conflict with registered package GaussianProcesses.jl

# main
export GaussianProcess, predict

# mean functions
export ConstMean, ZeroMean

# covariance functions
export SquaredExponential  

using RecipesBase

include("mean.jl")
include("covariance.jl")
include("gp.jl")
include("plot.jl")

end # module
