# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchAlgoWrapper = function(learner, show.info = TRUE) {
    
  function(job, static, dynamic) {

    obj = convertOMLTaskToMlr(static$task) 
    n = mlr::getTaskSize(obj$mlr.task)
    p = mlr::getTaskNFeats(obj$mlr.task)

    par.set  = getHyperSpace(learner = learner, p = p, n = n)

    # If there is no par.set -> Naive Bayes (run on defaults)
    if(length(par.set$pars) == 0) {
      res = runDefaults(task = static$task, learner = learner)
    } else {
      budget = length(par.set$pars) * TUNING.CONSTANT
      res = randomSearch(task = static$task, learner = learner, 
        par.set = par.set, maxiter = budget, show.info = TRUE) 
    }

    return(res)
  }
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
