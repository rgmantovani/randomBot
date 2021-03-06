# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

  devtools::load_all()

  # task.ids = setdiff(getTaggedTasks(tag = "study_14"), REMOVE)[1:3]
  task.ids = c(125921)
  populateOMLCache(task.ids = task.ids, overwrite = FALSE)

  unlink("test-files/", recursive = TRUE)
  reg = makeExperimentRegistry(
    id = "test", 
    packages = c("ParamHelpers", "mlr", "OpenML"), 
    src.dirs = "R/"
  )
  
  measures = c("predictive_accuracy")
  learners = getPredefinedLearners()[2]

  # Creating new jobs (one learner by time)
  aux = lapply(learners, function(learner) {

    par.set = getHyperSpace(learner = learner, p = 1, n = 100)
    if(length(par.set$pars) > 0) {
      budget = 3
    } else {
      budget = 1
    }
    
    # creating *budget* random runs for each task
    new.jobs = batchmark(reg = reg, task.id = task.ids, 
      learners = list(learner), measures = measures, 
      reps = budget, overwrite = TRUE)
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
  testJob(reg = reg, id = 1)
  # for(job in all.jobs){
  #   testJob(reg = reg, id = job, resources = list(walltime = 2))
  # }
  # testJob(reg = reg, id = 30, resources= list(walltime = 60*60*24*2))

  # catf(" * Submitting all jobs ...")

  # submitJobs(
  #   reg = reg, 
  #   ids = all.jobs, 
  #   resources = list(walltime = 60*60*24*2),
  #   job.delay = TRUE
  # )

  catf(" * Done.")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------