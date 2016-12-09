# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# install required packages from CRAN

install.packages(pkgs = c("devtools", "mlr", "RWeka", "e1071", "irace", "checkmate", "BatchExperiments",
  "rpart", "ranger", "gbm", "deepnet", "kknn"))

# install required packages from github repos
library("devtools")

install_github("berndbischl/ParamHelpers", ref = "9d374430701d94639cc78db84f91a0c595927189")
install_github("mlr-org/farff")
install_github("openml/r", ref = "36293a9da23a11b15698a060ef2ccbc56da5437d")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
