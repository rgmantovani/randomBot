# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

runExperiment = function() {

  reg = makeExperimentRegistry(
   id = "randomBot", 
    packages = c("ParamHelpers", "mlr", "OpenML"), 
    src.dirs = "R/"
  )

  tasks = getTaggedTasks(tag = "study_14")

  measures = c("predictive_accuracy", 
    "usercpu_time_millis_testing", 
    "usercpu_time_millis_training")

  learners = getPredefinedLearners()

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

  catf(" * Submitting all jobs ...")
  submitJobs(reg = reg, ids = all.jobs, job.delay = TRUE)
  status = waitForJobs(reg = reg, ids = all.jobs)
  catf(" * Done.")

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
