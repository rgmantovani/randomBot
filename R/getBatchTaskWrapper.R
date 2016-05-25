# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchTaskWrapper = function(task.id, measures) {
  
  task = getOMLTask(task.id = task.id)
  filled.task = fillTask(task = task, measures = measures)

  #convert and process the data
  obj = convertOMLTaskToMlr(filled.task)
  
  temp.task = imputeMissingValues(mlr.task = obj$mlr.task)
  temp.task = createDummyFeatures(obj = temp.task, method = "1-of-n")
  new.task = removeConstantFeatures(task = temp.task, perc = 0.01, show.info = TRUE)
  
  new.task$task.desc$dataset.id = task$input$data.set$desc$id 
  new.task$task.desc$dataset.name = task$input$data.set$desc$name 

  return(new.task)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
