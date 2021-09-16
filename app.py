import os, ast
import pandas as pd


target = "Purchase"
usecase = "classification"

dataset_path = "https://raw.githubusercontent.com/elBichon/easyML/master/juice.csv"
data = pd.read_csv(dataset_path)
data.head()

if usecase == 'regression':
    from pycaret.regression import *
elif usecase == 'classification':
    from pycaret.classification import *

exp1 = setup(data, target = target, session_id=123, silent=True, html=False, log_experiment=True, experiment_name='exp_github')

best = compare_models()

best_model = finalize_model(best)

save_model(best_model, 'model')

logs_exp_github = get_logs(save=True)
