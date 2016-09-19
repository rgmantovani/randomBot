# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# * Examples:
# reducingResultsByLearner(lrn = "classif.rpart")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

reducingResultsByLearner = function(lrn = NULL){

  if(is.null(lrn)) {
    stopf("Please, provide a valid classifier. ")
  }
  
  devtools::load_all()
  if(!dir.exists("output/")) {
    dir.create(path = "output/", recursive = TRUE)
  }

  reg = loadRegistry("randomBot-files")

  df = getJobInfo(reg, ids = findDone(reg))
  algos.names = gsub(x = unique(df$algo), pattern = ".preproc", replacement = "" )

  if(is.null(lrn) || lrn %nin% algos.names) {
    stop("Please, give a valid learners's name.\n")
  }

  fn.filter = function(job, res){
    algo.name = gsub(x = unique(job$algo.id), pattern = ".preproc", replacement = "" )
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

}
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------