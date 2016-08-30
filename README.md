# RandomBot

'RandomBot' is a bot that searches randomly the hyper-parameter space from different Machine Learning (ML) algorithms. 
It executes some 'mlr' [1] learners over OpenML [2] classification problems using the 'BatchExperiments' package [3] structure.

For each single job *j*, i.e., a combination of ```j = {algorithm, problem}```, the bot will evaluate ```N = 100 * D``` different hyper-parameter configurations through a Random Search (RS) tuning process. Here, *D* denotes the number hyper-space's dimension (the number of hyper-parameters), and *100* is the tuning constant defined by ourselves empirically.

### Technical Requirements

* R version >= 3.1.0
* Required packages: [mlr](https://cran.r-project.org/web/packages/mlr/index.html), [OpenML](https://github.com/openml/openml-r), [BatchExperiments](https://github.com/tudo-r/BatchExperiments), [checkmate](https://cran.r-project.org/web/packages/checkmate/index.html)

### Setup

To install all of the required R packages from CRAN, use the following commands:
```R
install.packages(c("devtools", "mlr", "BatchExperiments"))
devtools::install_github("openml/r")
```

of if you want to install the developer versions:
```R
install.packages(c("devtools"))
devtools::install_github("mlr-org/mlr")
devtools::install_github("openml/r")
devtools::install_github("tudo-r/BatchJobs")
devtools::install_github("tudo-r/BatchExperiments")
```

### Running the code

To run the project, please, call it by the bash file executing it by the command:
```
./runRandomBot.sh &
```

It will start the execution saving the status in an output log file. You can follow the execution and errors checking directly this log file. If you want to run experiments directly through the R script, you can call the command:
```
R CMD BATCH --no-save --no-restore reducingResultsByLearner.R out.log
```

### How it works?

The bot will load all the [OpenML](http://www.openml.org/) tasks defined by the user via the OpenML task ids (task), and all the 'mlr' learners defined in the configuration file (algo). After that, an experiment registry is created using the 'BatchExperiments' package: one single independent job for each combination of ```j = {algo, task}```. They will start in parallel and results will be saved in the '*randomBot-files*' directory (the registry's main folder). You have an example of application in the ```testingScript.R``` file.

To check the experiment's status you can start a new R session from the project's folder and use the commands:
```R
library("BatchExperiments")
showStatus(loadRegistry("randomBot-files/"))
```
It will show you the experiment's status as detailed in the 'BatchExperiments' documentation.

Eventually, you may need to restart the experiments. So, if you want to resubmit the jobs without creating them again, we defined a bash file to resubmit the unfinished ones. You just need to execute it by the command: 

```
./resubmitJobs.sh &
```

Finally, to summarize the hyper-parameters' values searched and their performances, you can bind all of the results calling the commands:
```R
devtools::load_all()
# Reducing kknn results as an example
reducingResultsByLearner(lrn = "classif.kknn") 
```
it will create an ```output```folder with two files for each learner: a *<learner>.RData* and a *<learner>.csv*. They contained the hyper-space searched during the executions.


### Contact

Rafael Gomes Mantovani (rgmantovani@gmail.com) University of São Paulo - São Carlos, Brazil.

### References

[1] Bernd Bischl, Michel Lang, Lars Kotthoff, Julia Schiffner, Jakob Richter, Zachary Jones, Giuseppe Casalicchio. mlr: Machine Learning in R, R package version 2.9. URL https://github.com/mlr-org/mlr.

[2] J. Vanschoren,  J.N. van Rijn, B. Bischl, and L. Torgo (2014). Openml: Networked  science  in  machine  learning. SIGKDD  Explor.  Newsl.,vol. 15, no. 2, pp. 49–60.

[3] Bernd Bischl, Michel Lang, Olaf Mersmann, Joerg Rahnenfuehrer, Claus Weihs (2015). BatchJobs and BatchExperiments: Abstraction Mechanisms for Using R in Batch Environments. Journal of Statistical Software, 64(11), 1-25. URL http://www.jstatsoft.org/v64/i11/.

### Citation

If you use our code/experiments in your research, please, cite [our paper]() where this project was first used:

[ADD citation]

### Bibtex 

[ADD bibtex entry]
