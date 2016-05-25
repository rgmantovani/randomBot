# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# oml.task = getOMLTask(14967)

imputeMissingValues = function(mlr.task) {

  dataset = mlr.task$env$data
  dataset = dataset[,colSums(is.na(dataset)) < nrow(dataset)]
  colnames(dataset) = make.names(names = colnames(dataset), unique = TRUE, allow_ = TRUE)

  if(any(is.na(dataset))) {
    cat(" - imputing data\n")
    temp = mlr::impute(data = dataset, target = mlr.task$task.desc$target,
      classes = list(numeric = imputeMedian(), factor = imputeMode()))
    mlr.task$env$data = temp$data
  }else {
    cat(" - no missing values (NAs)\n")
  }

  return(mlr.task)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
