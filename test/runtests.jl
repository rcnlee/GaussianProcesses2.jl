using GaussianProcesses2
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

using NBInclude
@nbinclude("../notebooks/Regression1D.ipynb")
