# import all the lib
import json

import joblib

def lambda_handler(event, context):
    YearsExperience = event['YearsExperience']
    lr_from_joblib = joblib.load('simple_linear_regression.pkl')
    pred = lr_from_joblib.predict([[YearsExperience]])
    results = json.dumps(list(pred))
    return  results