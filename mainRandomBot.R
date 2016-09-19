# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

main = function() {

  devtools::load_all()
  
  reg = makeExperimentRegistry(
   id = "randomBot", 
    packages = c("ParamHelpers", "mlr", "OpenML"), 
    src.dirs = "R/"
  )

  task.ids = setdiff(getTaggedTasks(tag = "study_14"), REMOVE)
  populateOMLCache(task.ids = task.ids, overwrite = FALSE)

  measures = c("predictive_accuracy", "usercpu_time_millis_testing", "usercpu_time_millis_training")
  learners = getPredefinedLearners()

  # Creating new jobs (one learner by time)
  aux = lapply(learners, function(learner) {
    par.set = getHyperSpace(learner = learner, p = 1, n = 100)

    if(length(par.set$pars) > 0) {
      budget = length(par.set$pars) * TUNING.CONSTANT
    } else {
      budget = 1
    }

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
 
  # Running what is not done and did not threw an error
  all.jobs = setdiff(findNotDone(reg), findErrors(reg))
  print(all.jobs)

  catf(" * Submitting all jobs ...")
  submitJobs(reg = reg, ids = all.jobs, job.delay = TRUE, resources = list(walltime = 3600 * 24 * 2))
  status = waitForJobs(reg = reg, ids = all.jobs)
  catf(" * Done.")

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

main()

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------