abstract type MeanFunction end

"""
    ConstMean

Constant mean function.
# Arguments
- `c::Float64`: mean value 
"""
struct ConstMean <: MeanFunction
    c::Float64
end
"""
    ZeroMean

Constant zero mean function.
"""
ZeroMean() = ConstMean(0.0)

(m::ConstMean)(x) = m.c 

