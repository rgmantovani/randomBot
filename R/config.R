# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# Required packages
library("checkmate")
library("OpenML")
library("mlr")
library("BatchExperiments")

# mlr and OpenML configurations
setOMLConfig(arff.reader = "RWeka")
setOMLConfig(confirm.upload = FALSE)
configureMlr(on.learner.error = "warn")
configureMlr(show.info = TRUE)

# Please, replace it by your own OpenML apikey
# saveOMLConfig(apikey = "your openml api key", overwrite = TRUE)
saveOMLConfig(apikey = "76444ac061f2b76258c96f680f0c6ae0", overwrite = TRUE)

# tuning constant
TUNING.CONSTANT = 100

# for debuging while coding
SHOULD.UPLOAD = FALSE

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------