# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchAlgoWrapper = function(learner, show.info = TRUE) {
    
  function(job, static, dynamic) {

    obj = convertOMLTaskToMlr(static$task) 
    n = mlr::getTaskSize(obj$mlr.task)
    p = mlr::getTaskNFeats(obj$mlr.task)

    par.set  = getHyperSpace(learner = learner, p = p, n = n)
    budget = length(par.set$pars) * TUNING.CONSTANT

    # Generates a random run 
    if(show.info) {
      print(par.set)
    }

    run.seed = sample.int(.Machine$integer.max, size = 1L)
    set.seed(run.seed)

    params = ParamHelpers::sampleValue(par.set, trafo = TRUE)
    new.params = params[!sapply(params, is.na)]

    new.lrn = setHyperPars(learner = learner, par.vals = new.params)
    oml.run = runTaskMlr(task = static$task, learner = new.lrn, seed = run.seed)
    
    run.id = NA  
    if(SHOULD.UPLOAD) {
      run.id = uploadOMLRun(run = oml.run, upload.bmr = TRUE)
      oml.run$run$run.id = run.id
    }
      
    perf = getBMRAggrPerformances(bmr = oml.run$bmr, as.df = TRUE)
    res = cbind(run.id, as.data.frame(params), static$task$task.id, perf, run.seed)
    colnames(res)[5:6] = c("task.id", "task.name")
   
    if(show.info) {
      print(res)
    }

    return(res)
  }
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
