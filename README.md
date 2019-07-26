# rf-analysis
Build the image form the Dockerfile
```
docker build -t rf-analysis .
```
To run and export the results to a results folder in the current working directory
```
docker run -v $(pwd)/results:/app/results:Z rf-analysis 
```
Multiple configuration options are available.

* perf : target column of the dataset, default at "vmlinux"
* resultsPath : directory for results, default at "results/", don't foregt to change docker volume if you change it
* nbFolds : number of folds for cross-validation, default at "10"
* minSampleSize : minimum size for the training set, default at "100
* maxSamplesize : maximum size for the training set, default at 90% of the size of the dataset
* paceSampleSize : set the growth of the size of training set, default at None
* nb_bins : number of different training set sizes that the algorithm will run over, default at 10
* nb_yes : set at 0 to ignore the column nb_yes, default at 1
* columns_to_drop : columns to drop from the dataset when learning on, default at "cid" + all columns for size
* algo : ML algorithm to use, default at "rf" for Random Forest, accept also "gb" for Grandient Boosting and "dt" for Decision Tree. Change results.csv file when changing algorithm.


All scikit learn random forest params : 

"criterion","splitter","max_features","max_depth","min_samples_split","min_samples_leaf", "min_weight_fraction_leaf","max_leaf_nodes","random_state","min_impurity_decrease","n_estimators"

https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestRegressor.html#sklearn.ensemble.RandomForestRegressor


Two possibilities to pass the params : 
* config file : create a config.json file in a config folder and pass it as a volume to the docker container.

  config.json example : 
  ```
  {
      "max_depth":[19,21,22,23],
      "nbFolds":5,
      "n_estimators":10,
      "min_samples_leaf":[1,4,8,10]
  }
  ```
  Pass it as a volume (only the "/app/config" must remain exactly the same): 
  ```
  docker run -v $(pwd)/results:/app/results:Z -v $(pwd)/config:/app/config rf-analysis 
  ```
  
 * Command-line option : pass it in the command line
 	```
    docker run -v $(pwd)/results:/app/results:Z rf-analysis --n_estimators 20
 	```
    
The two ways can be combined, the command line options will override the config.json file options.