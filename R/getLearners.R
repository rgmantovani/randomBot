# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# [*] mlr Wrapper learners
# http://mlr-org.github.io/mlr-tutorial/release/html/wrapper/index.html

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getPredefinedLearners = function() {

  lrn.rpart = makeLearner("classif.rpart" , predict.type = "prob")
  lrn.gbm   = makeLearner("classif.gbm" , predict.type = "prob")
  lrn.nb    = makeLearner("classif.naiveBayes", predict.type = "prob")

  # Classifiers that requires imputation
  lrn.kknn = makeImputeWrapper(
    learner = makeLearner("classif.kknn", predict.type = "prob"),
    classes = list(numeric = imputeMedian(), factor = imputeMode())
  )

  lrn.svm = makeImputeWrapper(
    learner = makeLearner("classif.svm", predict.type = "prob"),
    classes = list(numeric = imputeMedian(), factor = imputeMode())
  )

  lrn.ranger = makeImputeWrapper(
    learner = makeLearner("classif.ranger", predict.type = "prob"),
    classes = list(numeric = imputeMedian(), factor = imputeMode())
  )

  lrn.lda = makeImputeWrapper(
    learner = makeLearner("classif.lda", predict.type = "prob"),
    classes = list(numeric = imputeMedian(), factor = imputeMode())
  )

  lrn.qda = makeImputeWrapper(
    learner = makeLearner("classif.qda", predict.type = "prob"),
    classes = list(numeric = imputeMedian(), factor = imputeMode())
  )

  # All the learners remove constant and almost constant features
  aux = list(lrn.rpart, lrn.kknn, lrn.nb, lrn.svm, lrn.gbm, lrn.ranger, lrn.lda, lrn.qda)
  learners.list = lapply(aux, makeRemoveConstantFeaturesWrapper, perc = 0.01)

  return(learners.list)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------