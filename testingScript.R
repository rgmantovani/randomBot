# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
  
  devtools::load_all()

  unlink("test-files/", recursive = TRUE)

  reg = makeExperimentRegistry(
    id = "test", 
    packages = c("ParamHelpers", "mlr", "OpenML"), 
    src.dirs = "R/"
  )

  # tasks = getPredefinedTasks(pre)
  tasks = c(3647, 3577, 3731, 3729)

  measures = c("predictive_accuracy", 
    "usercpu_time_millis_testing", 
    "usercpu_time_millis_training")

  learners = getPredefinedLearners()#[6] # one just for test

  # Creating new jobs
  new.jobs = settingExperiment(
    reg       = reg,
    task.ids  = tasks, 
    learners  = learners,
    measures  = measures,
    overwrite = TRUE,
  )
 
  # Checking if is the first submission
  if( length(findDone(reg)) == 0 ) {
    catf(" * First execution of the experiments ...")
  } else {
    catf(" * There are remaining jobs or new ones ...")
  }
 
  # # Running what is not done
  all.jobs = setdiff(findNotDone(reg), findErrors(reg))
  print(all.jobs)

  # Call test jobs
  for(job in all.jobs){
    testJob(reg = reg, id = job)
  }

  # catf(" * Submitting all jobs ...")
  # submitJobs(reg = reg, ids = all.jobs, job.delay = TRUE)
  # status = waitForJobs(reg = reg, ids = all.jobs)

  # # catf(" * Saving results ...")
  # done.jobs = findDone(reg)
  # df = reduceDefaultResults(reg, done.jobs)
  catf(" * Done.")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
