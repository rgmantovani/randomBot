
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
  
randomSearch = function(task, learner, par.set, maxiter = 3, show.info = FALSE) {

  if(show.info) {
    print(par.set)
  }

  run.seed = sample.int(.Machine$integer.max, size = 1L)
  set.seed(run.seed)

  # sample 'maxiter' hyper-parameter settings
  vals = sampleValues(n = maxiter, par = par.set, trafo = TRUE)

  # Evaluate all of the settings
  aux = lapply(vals, function(params) {

    new.lrn = setHyperPars(learner = learner, par.vals = params)
    oml.run = runTaskMlr(task = task, learner = new.lrn)
    
    if(DEBUG) {
      run.id = 9999
    } else {
      run.id = uploadOMLRun(run = oml.run, upload.bmr = TRUE)
    }
    
    perf = getBMRAggrPerformances(oml.run$bmr, as.df=TRUE)[,-c(1:2)]
    ret = cbind(run.id, as.data.frame(params), perf)
    if(show.info) {
      print(ret)
    }
    
    return(ret)
  })

  # aggregate runs
  df = do.call("rbind", aux)
  return(df)

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------


