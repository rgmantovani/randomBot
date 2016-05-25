# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchAlgoWrapper = function(learner) {
    
  function(job, static, dynamic) {

    rdesc    = makeResampleDesc("CV", iters = 10L)
    par.set  = getHyperSpace(learner = learner, task = static$task)
    budget   = length(par.set$pars) * TUNING.CONSTANT
    ctrl     = makeTuneControlRandom(maxit = budget)
    measures = list(acc, ber, timetrain, timepredict)

    res = tuneParams(
      learner = learner, 
      task = static$task, 
      resampling = rdesc, 
      par.set = par.set,
      control = ctrl, 
      measures = measures, 
      show.info = TRUE
    )

    res$dataset.name = static$task$task.desc$dataset.name
    res$dataset.id = static$task$task.desc$dataset.id
   
    return(res)
  }

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
