# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

  devtools::load_all()
	
  num.jobs = 10 #just for test
  tasks.ids = getFilteredActiveOMLTasks()[1:350]

  # testing this specifics learners
  pre.selected.lrns = c("classif.ada")

  lrn.list = getPreDefinedMlrLearners()

  # while(TRUE){

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
  
    print(reg)
    catf("----------------------------------------")
    for(id in job.ids){
      testJob(reg = reg, id = id)
    catf("----------------------------------------")
    catf("----------------------------------------")
    }
    # catf("----------------------------------------")
    
  # }


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
