# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getAllMlrLearners = function(oml.task) {

  # Datasets with no Class target, but it has on the task
  if (length(oml.task$input$data.set$target.features) == 0) {
    oml.task$input$data.set$target.features = oml.task$input$target.features
  }

  if(length(oml.task$input$evaluation.measures) == 0) {
  	oml.task$input$evaluation.measures = "predictive_accuracy"
  }

  obj = convertOMLTaskToMlr(oml.task)
  
  lrn.list = listLearners(obj$mlr.task, create = TRUE, properties = "prob")
  return(lrn.list)

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getPreDefinedMlrLearners = function() {

	lrn.list = lapply(pre.selected.lrns, makeLearner)
	return(lrn.list)

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------