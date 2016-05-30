# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getRangerSpace = function(...) {
  args = list(...)
  par.set = makeParamSet(
    makeIntegerParam("mtry", lower = round(args$p ^ 0.1), upper = round(args$p ^ 0.9)),
    makeIntegerParam("num.trees", lower = 0, upper=10, trafo = function(x) 2^x)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getNnTrainSpace = function(...) {
  par.set = makeParamSet(
    makeIntegerVectorParam("hidden", len=2, lower= 0, upper=10, trafo = function(x) 2^x, cnames=NULL),
    makeNumericParam("learningrate", lower = -5, upper = 0, trafo = function(x) 10^x),
    makeNumericParam("momentum", lower = 0.1, upper = 0.9),
    makeIntegerParam("numepochs", lower = 2, upper = 1000)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getKknnSpace = function(...) {
  par.set = makeParamSet(
    makeIntegerParam("k", lower = 1, upper = 50, default = 1)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getSvmSpace = function(...) {
  par.set = makeParamSet(
    makeDiscreteParam("kernel", values = "radial", default = "radial", tunable = FALSE),
    makeNumericParam("cost" , lower = -12, upper = 12, trafo = function(x) 2^x),
    makeNumericParam("gamma", lower = -12, upper = 12, trafo = function(x) 2^x)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getRpartSpace = function(...) {
  args = list(...)
  par.set = makeParamSet(
    makeNumericParam("cp", lower = -4, upper = -1, trafo = function(x) 10^x),
    makeIntegerParam("minsplit", lower = 1, upper = min(7, floor(log2(args$n))), trafo = function(x) 2^x),
    makeIntegerParam("minbucket", lower = 0, upper = min(6, floor(log2(args$n))), trafo = function(x) 2^x)
  )
  return(par.set)  
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getGbmSpace = function(...) {
  par.set = makeParamSet(
    makeIntegerParam("n.trees", lower = 500, upper = 10000),
    makeIntegerParam("interaction.depth", lower = 1, upper = 5),
    makeNumericParam("shrinkage", lower = -4, upper = -1, trafo = function(x) 10^x)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

#TODO: DBN space, SAE Space, H20 Space

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# getAvNNetSpace = function() {
#   par.set = makeParamSet(
#     makeLogicalParam("bag"),
#     makeIntegerParam("repeats", lower = 1, upper = 50)
#   )
#   return(par.set)
# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# getAdaSpace = function() {
#   par.set = makeParamSet(
#     makeIntegerParam("iter", lower = 2, upper = 128, default = 50),
#     makeNumericParam("nu", lower = 0, upper = 0.5, default = 0.1),
#     makeIntegerParam("minsplit", lower = 1, upper = 64, default = 20),
#     makeIntegerParam("maxdepth", lower = 1, upper = 30, default = 30)
#   )
#   return(par.set)
# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# getRandomForestSpace = function() {
#   par.set = makeParamSet(
#     makeIntegerParam("ntree", lower = 2, upper = 512, default = 500),
#     makeIntegerParam("mtry",  lower = 2, upper = 50)
#   )
#   return(par.set)
# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# getSvmSpace = function() {
#   par.set = makeParamSet(
#     makeDiscreteParam("kernel", values = c("linear","polynomial","radial","sigmoid"), default = "polynomial"),
#     makeNumericParam("cost", lower = -15, upper = 15, trafo = function(x) 2^x),
#     makeIntegerParam("degree",lower = 1,upper = 5, requires = quote(kernel == "polynomial")),
#     makeNumericParam("coef0",lower = 0, upper = 1, requires = quote(kernel == "polynomial")),
#     makeNumericParam("gamma", lower=-15, upper=15, default = -6, trafo = function(x) 2^x, 
#      requires = quote(kernel == "radial"))
#   )
#   return(par.set)
# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# getJ48Space = function() {
#   par.set = makeParamSet(
#     makeNumericParam("C", lower = 0.001, upper = 0.5, default = 0.25),
#     makeIntegerParam("M", lower = 1, upper = 64, default = 2)
#   )
#   return(par.set)  
# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# getPARTSpace = function() {
#   par.set = makeParamSet(
#     makeIntegerParam("M", lower = 1, upper = 64, default = 2),
#     makeIntegerParam("N", lower = 2, upper = 5, default = 3)
#   )
#   return(par.set)
# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# getBoostingSpace = function() {
#   par.set = makeParamSet(
#     makeIntegerParam("minsplit", lower = 1, upper = 64, default = 20),
#     makeNumericParam("cp", lower = 0, upper = 1, default = 0.01),
#     makeIntegerParam("maxdepth", lower = 1, upper = 30, default = 30)
#   )
#   return(par.set)
# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
