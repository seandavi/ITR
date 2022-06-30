library(caret)
rfGrid <- expand.grid(mtry=floor(ncol(features)/3))

randomforestFit <- train(features, target, method="rf", 
                         trControl=fitControl, tuneGrid=rfGrid,
                         ntree=100)
rfModel <- randomforestFit$finalModel

# Overall accuracy
print(randomforestFit)

# Accuracy per CV-fold
print(randomforestFit$resample)

# Variable Importance
print(rfModel$importance[order(rfModel$importance, decreasing=T),])
