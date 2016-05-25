# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getPredefinedTasks = function(ids) {

  temp.tasks = listOMLTasks(status = "active")
  tasks = temp.tasks[temp.tasks$task.id %in% ids, ]
  tasks$dim = tasks$NumberOfInstances * tasks$NumberOfFeatures
  tasks = tasks[ order(tasks$dim, decreasing = FALSE), ]

  return(tasks$task.id)
}


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getTaggedTasks = function(tag) {

  tasks = listOMLTasks(tag = tag)
  tasks$dim = tasks$NumberOfInstances * tasks$NumberOfFeatures
  tasks = tasks[ order(tasks$dim, decreasing = FALSE), ]

  return(tasks$task.id)
}


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------