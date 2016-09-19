# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# * Examples:
# reducingResultsByLearner(lrn = "classif.rpart")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

reducingResultsByLearner = function(reg, lrn = NULL){

  if(is.null(lrn)) {
    stopf("Please, give a learner name!")
  }
  
  devtools::load_all()
  if(!dir.exists("output/")) {
    dir.create(path = "output/", recursive = TRUE)
  }

  df = getJobInfo(reg)
  # save(x = df, file = paste0("output/allJobsInfo.RData"))
 
  algos.names = gsub(pattern=".preproc|.imputed", replacement="", x=unique(df$algo))
  if(is.null(lrn) || lrn %nin% algos.names) {
    stopf("There is no results for this learner. Please, provide a valid name.")
  }

  fn.filter = function(job, res){
    algo = gsub(pattern=".preproc|.imputed", replacement="", x=unique(job$algo.id))
    return(algo == lrn)
  }
  sel.ids = filterResults(reg = reg, ids = getJobIds(reg), fun = fn.filter)

  # ADD all jobs (with errors)
  cat(" - ", length(sel.ids), "job(s) was(were) found for learner:\'",lrn,"\'\n")
  ret = reduceResultsExperiments(reg, ids = sel.ids, impute.val=list())
  
  # write.csv with the output/RData
  # output.file = paste0(gsub(x = lrn, pattern = "\\.", replacement = "_"), "_space")
  # write.csv(x = ret, file = paste0("output/", output.file, ".csv"))
  # save(x = ret, file = paste0("output/", output.file, ".RData"))
  return(ret)

}
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------