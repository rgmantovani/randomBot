# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

library("checkmate")
library("OpenML")
library("mlr")
library("BatchJobs")

# Random bot account
saveOMLConfig(apikey = "b3a1ccb9bedf60d842b48b67209f842e", overwrite=TRUE)

setOMLConfig(verbosity = 0)
setOMLConfig(confirm.upload = FALSE)
configureMlr(show.info = FALSE)

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------