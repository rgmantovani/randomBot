# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# [*] mlr Wrapper learners
# http://mlr-org.github.io/mlr-tutorial/release/html/wrapper/index.html

# TODO: add SAE, DBN and H20 learners

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getPredefinedLearners = function() {

  lrn.rpart = makeLearner("classif.rpart", id = "classif.rpart", predict.type = "prob")
  lrn.gbm   = makeLearner("classif.gbm", predict.type = "prob")

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

  # # FIX ME: just use this when the wrappers work
  # TODO: call makeDummyFeauturesWrapper for nnTrain
  # lrn.nnTrain = makeImputeWrapper(
  #   learner = makeLearner("classif.nnTrain", predict.type = "prob"),
  #   classes = list(numeric = imputeMedian(), factor = imputeMode())
  # )

  # All the learners remove constant and almost constant features
  aux = list(lrn.rpart, lrn.kknn, lrn.svm, lrn.gbm, lrn.ranger) #, lrn.nnTrain
  learners.list = lapply(aux, makeRemoveConstantFeaturesWrapper, perc = 0.01)

  return(learners.list)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------