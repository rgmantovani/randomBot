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
TUNING.CONSTANT = 1 #100 

# for debuging while coding
# DEBUG = TRUE
DEBUG = FALSE

#Sorted according to the runtime (faster to lowest)
selected.tasks = c(3494, 3492, 3493, 11, 3913, 10093, 9980, 3019, 9946, 9971, 10101, 37,
  3918, 3560, 49, 9903, 9905, 53, 9957, 3512, 21, 3549, 3902, 9909, 31, 3567, 3903,
  9967, 3917, 23, 9904, 9906, 36, 9979, 9978, 3022, 3, 18, 9902, 9952, 9970, 43, 3896,
  9960, 45, 22, 9964, 2074, 16, 12, 58, 14, 28, 32, 9908, 2075, 3899, 3485, 20, 9981,
  9954, 3510, 9956, 9950, 9985, 3954, 9955, 6)


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------