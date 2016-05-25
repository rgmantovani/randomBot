# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# Reducing results from a "default" setup
reduceDefaultResults = function(reg, job.ids) {

  res.list = reduceResultsList(
    reg = reg, 
    ids = job.ids,
    fun = function(job, res) {
      values = as.data.frame(res$opt.path)
      values$dataset.id   = res$dataset.id
      values$dataset.name = res$dataset.name
      return(values)
  })
  return(res.list)
}

#   df = reduceResultsExperiments(
#     reg = reg,
#     ids = job.ids,
#     fun = function(job, res) {

#       values = as.data.frame(res$opt.path)
#       values$dataset.id   = res$dataset.id
#       values$dataset.name = res$dataset.name
#       return(values)
#     }
#   )
#   return(df)
# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------