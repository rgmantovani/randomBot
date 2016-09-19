# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

  devtools::load_all()

  task.ids = c(3494, 3492, 3493)
  populateOMLCache(task.ids = task.ids, overwrite = FALSE)
 
  # unlink("test-files/", recursive = TRUE)
  reg = makeExperimentRegistry(
    id = "test", 
    packages = c("ParamHelpers", "mlr", "OpenML"), 
    src.dirs = "R/"
  )
  
  measures = c("predictive_accuracy", "usercpu_time_millis_testing", "usercpu_time_millis_training")
  learners = getPredefinedLearners()[1:3]

  # Creating new jobs (one learner by time)
  aux = lapply(learners, function(learner) {

    par.set = getHyperSpace(learner = learner, p = 1, n = 100)
    budget = 10
    
    # creating *budget* random runs for each task
    inner.aux = lapply(task.ids, function(task.id) {
    
      new.jobs = batchmark(reg = reg, task.id = task.ids, learners = list(learner),
        measures = measures, reps = budget, overwrite = TRUE)
      return(new.jobs)
    
    })
    return(unlist(inner.aux))
  })
  
  all.jobs = setdiff(findNotDone(reg), findErrors(reg))

  # Checking if is the first submission
  if( length(findDone(reg)) == 0 ) {
    catf(" * First execution of the experiments ...")
  } else {
    catf(" * There are remaining jobs or new ones ...")
  }
  print(all.jobs)

  # Call test jobs
  # for(job in all.jobs){
  #   testJob(reg = reg, id = job, resources = list(walltime = 2))
  # }

  catf(" * Submitting all jobs ...")
  submitJobs(
    reg = reg, 
    ids = all.jobs, 
    resources = list(walltime = 60*60*24*2),
    job.delay = TRUE
  )

  # getBatchJobsConf()$default.resources
  # res1 = getJobResources(reg)

  # status = waitForJobs(reg = reg, ids = all.jobs)
  catf(" * Done.")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------