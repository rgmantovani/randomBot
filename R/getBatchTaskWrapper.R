# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# An OpenML task just can be converted to an oml object, if:
#   1. it has at least one evaluation measure defined
#   2. the task and its dataset (both) must have least one target feature specified

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchTaskWrapper = function(task.id, measures) {
  
  task = getOMLTask(task.id = task.id)
  task$input$evaluation.measures = measures
  if (length(task$input$data.set$target.features) == 0) {
    task$input$data.set$target.features = task$input$target.features
  }
  return(task)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
