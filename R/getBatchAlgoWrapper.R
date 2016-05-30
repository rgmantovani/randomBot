# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchAlgoWrapper = function(learner) {
    
  function(job, static, dynamic) {

    obj = convertOMLTaskToMlr(static$task) 
    n = mlr::getTaskSize(obj$mlr.task)
    p = mlr::getTaskNFeats(obj$mlr.task)

    par.set  = getHyperSpace(learner = learner, p = p, n = n)

    budget = length(par.set$pars) * TUNING.CONSTANT
    res = randomSearch(task = static$task, learner = learner, 
      par.set = par.set, maxiter = budget, show.info = TRUE) 

    return(res)
  }
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
