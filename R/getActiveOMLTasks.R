# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getFilteredActiveOMLTasks = function() {

  tasks = listOMLTasks(status = "active")

  tasks.ids = which(tasks$task.type == "Supervised Classification"	 
    & tasks$estimation.procedure == "10-fold Crossvalidation"
    & tasks$NumberOfInstances >= 100 
    & tasks$NumberOfInstances <= 100000
    & tasks$NumberOfMissingValues == 0)

  sel.tasks = tasks[tasks.ids, ]
  
  sel.tasks$dims = sel.tasks$NumberOfInstances * sel.tasks$NumberOfFeatures
  sel.tasks = sel.tasks[ order(sel.tasks$dims, decreasing = FALSE), ]

  # Remove big datasets (using this - 431, without - 526)
  # sel.tasks = sel.tasks[sel.tasks$dims < 10^6,]

  # Tasks with errors - will give an error anyway
  # remove.tasks = c(3509, 3508, 8, 10107, 10109)
  # ret = setdiff(sel.tasks$task_id, remove.tasks)

  return (sel.tasks$task.id)
}


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------