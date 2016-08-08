# RandomBot

RandomBot is a random bot that searches the hyper-parameter space from different Machine Learning (ML) classifiction algorithms. It executes 

to sample hyper-parameter values and performance from different Machine Learning algorithms performed in classification problems.



### Technical Requirements

* R version >= 3.1.0
* Required packages: [mlr](https://cran.r-project.org/web/packages/mlr/index.html), [OpenML](https://github.com/openml/openml-r), [BatchExperiments] ("https://github.com/tudo-r/BatchExperiments"), [checkmate]

library("checkmate")


https://github.com/mlr-org/mlr


### Setup

To install all of the required R packages, use the follow commands:
```R
install.packages(c("devtools", "RWeka"))
devtools::install_github("mlr-org/mlr")
devtools::install_github("openml/r")
install.packages("BatchExperiments")
```

### Running the code

To run the project, execute it by the command:

```
./run.sh &
```
It will call the bash file and start the execution creating an output log file called '*out-Mfeat.log*'. You can follow 
the execution and errors checking directly the log file.

If you want to run experiments directly through the R script, you can call the command:
````
R CMD BATCH --no-save --no-restore mainFeatureAnalysis.R out-Mfeat.log &
```

Results will be saved in a directory call '*temp*', one per dataset (if exist more than one). A final meta-base csv file will be saved automatically in the project's directory.

### Binding results ####




### Contact

Rafael Gomes Mantovani (rgmantovani@gmail.com) University of São Paulo - São Carlos, Brazil.

### References

[OpenML Rerefence]

[mlr Reference]

[3] Bernd Bischl, Michel Lang, Olaf Mersmann, Joerg Rahnenfuehrer, Claus Weihs (2015). BatchJobs and BatchExperiments: Abstraction Mechanisms for Using R in Batch Environments. Journal of Statistical Software, 64(11), 1-25. URL http://www.jstatsoft.org/v64/i11/.

### Citation

If you use our code/experiments in your research, please, cite [our paper]():

[ADD citation]

### Bibtex 

[ADD bibtex entry]
