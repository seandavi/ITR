library(caret)
#how to split into train/validation using cross-validation
fitControl <- trainControl( 
    method="repeatedcv",
    number=10,
    ## repeated once
    repeats=1,
    verboseIter=T)

#creat a range of parameters to investigate
# - alpha -  is the elasticnet mixing parameter: 1-α)/2||β||_2^2+α||β||_1
# - lambda - is the regularization parameter governing the relative importance of minimizing error vs keeping betas small
lassoGrid <- expand.grid(alpha=1, lambda=10^seq(-6, 0, 1))

#train model
lassoFit <- train(features, target, method="glmnet",
                  trControl=fitControl, tuneGrid=lassoGrid)
lassoModel <- lassoFit$finalModel
#What metric is being used? Hint: print names(lassoFit) and get the metric used.

# Overall accuracy
print(lassoFit)

# Accuracy per CV-fold (for best model)
print(lassoFit$resample)

# We can inspect the coefficients for different values of the
# L1 penalty lambda - play around and see what happens.
print(coef(lassoModel, s=1e-4))
print(coef(lassoModel, s=1))

# We can also plot the entire regularization path
# The numbers shown are the feature (column) ids - to get the name of the
# feature, you can do colnames(features)[10], for instance.
# the numbers at the top are the numbers of nonzero coefficients
plot(lassoModel, "lambda", label=T)
