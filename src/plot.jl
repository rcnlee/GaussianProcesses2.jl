
@recipe function f(GP::GaussianProcess)
    @series begin
        seriestype := :scatter
        xlabel := "x"
        ylabel := "f(x)"
        label := "data points"
        GP.X, GP.y
    end
end
@recipe function f(GP::GaussianProcess, X_pred)
    @series begin
        GP
    end
    @series begin
        seriestype := :path
        label := "predicted mean"

        ms, νs = predict(GP, X_pred)
        ribbon := sqrt.(νs)  #standard deviation
        
        X_pred, ms
    end
end
