# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# install required packages

install.packages(pkgs = c("devtools, RWeka", "e1071", "irace", "checkmate", "BatchExperiments",
  "rpart", "ranger", "gbm", "deepNet", "kknn"))

library("devtools")

install_github("berndbischl/ParamHelpers", ref = "9d374430701d94639cc78db84f91a0c595927189")
install_github("mlr-org/mlr", ref = "e8801bcb5ad1ac7c5fdfc7b862df7eb4c37a698a")
install_github("mlr-org/mlrMBO", ref = "#98dacf7cff03426cc64264686d9611bb0a99ea83")


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------