# Install packages
#=================
#Do this at the beginning of the lab
install.packages("caret", dependencies=T)
install.packages(c("randomForest", "glmnet"), dependencies=T)

require(caret)
require(randomForest)
require(glmnet)
#setwd("~/Downloads/expression-prediction")

# Load the preprocessed data
fullFeatureSet <- read.table("features.txt");
target <- scan("target.txt")

# You can see the full list of features in fullFeatureSet using:
names(fullFeatureSet)

# Now run lasso with the full feature set:
features <- fullFeatureSet
source("runLasso.R")

# Final model is in lassoFit.
# Lets plot the predictions vs original targets.
lassoPreds <- predict(lassoFit, newdata=features)
plot(target, lassoPreds)

# Also run a random forest with:
source("runRF.R")
# This will print feature importance scores for the random forest.
# Larger values reflect greater feature importance.

# Final model is in randomforestFit.
# Lets plot the predictions vs original targets.
randomforestPreds <- predict(randomforestFit, newdata=features)
plot(target, randomforestPreds)

# ===================
# Further exploration
# ===================
# - How does the performance of random forests compare to the lasso?
#   (you can look at the output of print(lassoFit) and print(randomforestFit))
#
# - How do other models perform? You can try other models by changing the
#   "method" parameter in the "train" call. Some suggestions for models:
#   linear regression, "lm"  and regression trees, "rpart2".
#
# - Construct a proper test set and re-run the analyses 
#
# - How do the individual histone marks contribute to the accuracy of the
#   predictions? You can formulate hypotheses about which marks are important
#   and only include those in the feature matrix when learning your model to
#   see how they do. We provide some code below to help you with this.
#

# We will experiment with the weights that lasso regression produces when given
# a subset of the features. First, create a column vector specifying the names
# of a subset of the features with:
featureSubset <- c("Control", "H3k4me1", "H3k4me2", "H2az", "H3k27me3",
                   "H3k36me3", "H3k9me1", "H3k9me3", "H4k20me1")

# Now create the variable “features” which contains this subset of features:
features <- fullFeatureSet[featureSubset]

# You will now run lasso regression.
source("runLasso.R")

# runLasso.R will generate a plot where the y axis is the coefficient of the
# weights assigned to the various features by lasso, the bottom x-axis is the
# log of the regularisation parameter lambda, and the top x-axis is the number
# of non-zero weights for that particular value of the regularisation parameter.
# The numbers on the lines correspond to the indices of the features in
# “featureSubset”. The numbers at the top are the numbers of nonzero betas.
