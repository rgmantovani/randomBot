# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

settingExperiment = function(reg, task.ids, learners, measures, repls = 1L, 
  overwrite = FALSE) {

  # Calling batchmark for each task id
  aux = lapply(task.ids, function(task.id) {
    
    exec = batchmark(
      reg       = reg, 
      task.id   = task.id,
      learners  = learners, 
      measures  = measures,
      repls     = repls, 
      overwrite = overwrite
    )
    return(exec)
  
  })

  job.ids = unlist(aux)
  return(job.ids)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------