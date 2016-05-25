# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

batchmark = function(reg, task.id, learners, measures, repls = 1L, overwrite = FALSE) {
  
  BatchExperiments:::checkExperimentRegistry(reg)
  
  if ( any(c("mlr", "OpenML") %nin% names(reg$packages)) ) {
    stop("\'mlr\' and \'OpenML\' are required on the slaves, please add them via 'addRegistryPackages'")
  }

  assertCount(repls)
  assertFlag(overwrite)
  
  learners.names = vcapply(learners, "[[", "id")

  # Adding problems (tasks)
  problem.designs = Map(
    f = function(id, task.id, seed) {
      task = getBatchTaskWrapper(task.id, measures)
      static = list(task = task)
      addProblem(reg = reg, id = id, static = static, overwrite = overwrite, seed = seed)
      makeDesign(id = id)
    }, 
    id = paste0("OpenML_Task_", task.id), 
    task.id = task.id,
    seed = reg$seed + seq_along(task.id)
  )
  
  algorithm.designs = Map(
    f = function(id, learner, tag) {
      apply.fun = getBatchAlgoWrapper(learner)
      addAlgorithm(reg = reg, id = id, fun = apply.fun, overwrite = overwrite)
      makeDesign(id = id)
    },
    id = learners.names, 
    learner = learners
  )

  # Creating jobs
  job.ids = addExperiments(reg = reg, prob.designs = problem.designs, 
    algo.designs = algorithm.designs, repls = repls, skip.defined = TRUE)

  return (job.ids)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
