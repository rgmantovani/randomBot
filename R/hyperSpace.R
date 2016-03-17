# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getAvNNetSpace = function() {
  par.set = makeParamSet(
    makeLogicalParam("bag"),
    makeIntegerParam("repeats", lower = 1, upper = 50)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getIBkSpace = function() {
  par.set = makeParamSet(
    makeIntegerParam("K", lower = 1, upper = 64, default = 1)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------


getAdaSpace = function() {
  par.set = makeParamSet(
    makeIntegerParam("iter", lower = 2, upper = 128, default = 50),
    makeNumericParam("nu", lower = 0, upper = 0.5, default = 0.1),
    makeIntegerParam("minsplit", lower = 1, upper = 64, default = 20),
    makeIntegerParam("maxdepth", lower = 1, upper = 30, default = 30)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getRandomForestSpace = function() {
  par.set = makeParamSet(
    makeIntegerParam("ntree", lower = 2, upper = 512, default = 500),
    makeIntegerParam("mtry",  lower = 2, upper = 50)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getSvmSpace = function() {
  par.set = makeParamSet(
    makeDiscreteParam("kernel", values = c("linear","polynomial","radial","sigmoid"), default = "polynomial"),
    makeNumericParam("cost", lower = -15, upper = 15, trafo = function(x) 2^x, default = 0),
    makeIntegerParam("degree",lower = 1,upper = 5, requires = quote(kernel == "polynomial")),
    makeNumericParam("coef0",lower = 0, upper = 1, requires = quote(kernel == "polynomial")),
    makeNumericParam("gamma", lower=-15, upper=15, trafo = function(x) 2^x, default = 0.01,
     requires = quote(kernel == "radial"))
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getRpartSpace = function() {
  par.set = makeParamSet(
    makeIntegerParam("minsplit", lower = 1, upper = 100, default = 20),
    makeIntegerParam("minbucket", lower = 1, upper = 5),
    makeNumericParam("cp", lower = 0, upper = 1, default = 0.01),
    makeIntegerParam("maxdepth", lower = 1, upper = 30, default = 30)
  )
  return(par.set)  
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getJ48Space = function() {
  par.set = makeParamSet(
    makeNumericParam("C", lower = 0, upper = 1, default = 0.25),
    makeIntegerParam("M", lower = 1, upper = 64, default = 2)
  )
  return(par.set)  
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------


getGbmSpace = function() {
  par.set = makeParamSet(
    makeIntegerParam("n.trees", lower = 100, upper = 10000),
    makeIntegerParam("interaction.depth", lower = 1, upper = 5),
    makeNumericParam("shrinkage", lower = -15, upper = -4, default = 0.001, trafo = function(x) 2^x)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getPARTSpace = function() {
  par.set = makeParamSet(
    makeIntegerParam("M", lower = 1, upper = 64, default = 2),
    makeIntegerParam("N", lower = 2, upper = 5, default = 3)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBoostingSpace = function() {
  par.set = makeParamSet(
    makeIntegerParam("minsplit", lower = 1, upper = 64, default = 20),
    makeNumericParam("cp", lower = 0, upper = 1, default = 0.01),
    makeIntegerParam("maxdepth", lower = 1, upper = 30, default = 30)
  )
  return(par.set)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
