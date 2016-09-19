# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# * Examples:
# reducingResultsByLearner(lrn = "classif.rpart")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

reducingResultsByLearner = function(reg, lrn = NULL){

  if(is.null(lrn)) {
    stopf("There is no results for this learner. Please, provide a valid name.")
  }
  
  devtools::load_all()
  if(!dir.exists("output/")) {
    dir.create(path = "output/", recursive = TRUE)
  }

  # reg = loadRegistry("randomBot-files")

  df = getJobInfo(reg, ids = findDone(reg))
 
  # TODO: Replace by a regex
  algos.names = gsub(x = unique(df$algo), pattern = ".preproc", replacement = "" )
  algos.names = gsub(x = algos.names, pattern = ".imputed", replacement = "" )

  if(is.null(lrn) || lrn %nin% algos.names) {
    stop("Please, give a valid learner name.\n")
  }

  # TODO: Replace by a regex
  fn.filter = function(job, res){
    algo.name = gsub(x = unique(job$algo.id), pattern = ".preproc", replacement = "" )
    algo.name = gsub( x = algo.name, pattern = ".imputed", replacement = "" )
    return(algo.name == lrn)
  }
  
  sel.ids = filterResults(reg = reg, ids = findDone(reg), fun = fn.filter)
  cat(" - ", length(sel.ids), "job(s) were found for learner:\'",lrn,"\'\n")

  res.list = reduceDefaultResults(reg = reg, ids = sel.ids)
  ret = do.call("rbind", res.list)

  # write.csv with the output/RData
  output.file = paste0(gsub(x = lrn, pattern = "\\.", replacement = "_"), "_space")
  write.csv(x = ret, file = paste0("output/", output.file, ".csv"))
  save(x = ret, file = paste0("output/", output.file, ".RData"))
  return(ret)

}
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------