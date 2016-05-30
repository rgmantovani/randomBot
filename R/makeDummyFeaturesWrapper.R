# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

 # temp.task = createDummyFeatures(obj = temp.task, method = "1-of-n")
  # new.task = removeConstantFeatures(task = temp.task, perc = 0.01, show.info = TRUE)
 
makeDummyFeaturesWrapper = function(learner, ...) {

   learner = checkLearner(learner)
  
  trainfun = function(data, target, args=list(...)) {

  }

  predictfun = function(data, target, args, control) {

  }

  obj = makePreprocWrapper(
    learner = learner, 
    train   = trainfun, 
    predict = predictfun, 
    par.set = makeParamSet(
      ),
      par.vals = list() 
  )

  return(obj)

}

# makeRemoveConstantFeaturesWrapper
# function (learner, perc = 0, dont.rm = character(0L), na.ignore = FALSE, 
#     tol = .Machine$double.eps^0.5) 
# {
#     learner = checkLearner(learner)
#     args = list(perc = perc, dont.rm = dont.rm, na.ignore = na.ignore, 
#         tol = tol)
#     rm(list = names(args))
#     trainfun = function(data, target, args) {
#         args$dont.rm = union(args$dont.rm, target)
#         tmp = do.call(removeConstantFeatures, c(list(obj = data), 
#             args))
#         list(data = tmp, control = list(dropped.cols = setdiff(names(data), 
#             names(tmp))))
#     }
#     predictfun = function(data, target, args, control) {
#         dropNamed(data, control$dropped.cols)
#     }
#     lrn = makePreprocWrapper(learner, trainfun, predictfun, par.vals = args)
#     addClasses(lrn, "removeConstantFeaturesWrapper")
# }



# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
