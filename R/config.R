# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# Required packages
library("checkmate")
library("OpenML")
library("mlr")
library("BatchExperiments")

# mlr and OpenML configurations
saveOMLConfig(apikey = "76444ac061f2b76258c96f680f0c6ae0", overwrite = TRUE)
setOMLConfig(arff.reader = "RWeka")
setOMLConfig(confirm.upload = FALSE)
configureMlr(on.learner.error = "warn")
configureMlr(show.info = TRUE)

# tuning constant
TUNING.CONSTANT = 1#100 #3 

# for debuging while coding
DEBUG = TRUE # FALSE

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------