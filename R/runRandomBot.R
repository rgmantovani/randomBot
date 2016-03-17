# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

runRandomBot = function() {

  num.jobs = 1000
  tasks.ids = getFilteredActiveOMLTasks()
  lrn.list = getPreDefinedMlrLearners()

  while(TRUE){

    unlink("randomJobs-files/", recursive = TRUE)
    
    reg = makeRegistry(
      id = "randomJobs", 
      packages = c("ParamHelpers", "mlr", "OpenML"), 
      src.dirs = "R/"
    )

    job.ids = batchMap(
      reg = reg, 
      fun = createRandomOMLRun,
      1:num.jobs, 
      more.args = list(
        tasks.ids = tasks.ids, 
        lrn.list = lrn.list
      )
    )
    submitJobs(reg = reg)
    waitForJobs(reg = reg)
  }

}


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

createRandomOMLRun = function(id, tasks.ids, lrn.list) {

  task.id = sample(x = tasks.ids, size = 1)
  oml.task = getOMLTask(task.id = task.id)
  catf(" *** OML task *** ")
  print(oml.task) 
  
  catf("*** Learner: ***")
  lrn = sample(x = lrn.list, size = 1)[[1]]
  print(lrn$name)	
  
  catf(" *** Hyperparameter space *** ")
  par.set = getHyperSpace(lrn)
  print(par.set)

  # get a sample (configuration) randomly from that parameter space
  catf(" *** New random hyperparameter setting *** ")
  random.parSet = lapply(par.set$pars, ParamHelpers::sampleValue)
  print(random.parSet)

  new.parSet = ParamHelpers::trafoValue(par.set, random.parSet)

  new.lrn = setHyperPars(learner = lrn, par.vals = new.parSet)
  oml.run = runTaskMlr(task = oml.task, learner = new.lrn)
  run.id = uploadOMLRun(run = oml.run$run)

  tags = c("randomBot", "mlr")
  tagOMLObject(id = run.id, object = "run", tags = tags)

}


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------