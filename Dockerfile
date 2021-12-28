FROM public.ecr.aws/lambda/python:3.7

RUN pip3 install --upgrade pip

RUN pip3 install -U scikit-learn

COPY simple_linear_regression.pkl simple_linear_regression.pkl
COPY lambda_function.py lambda_function.py

CMD [ "lambda_function.lambda_handler" ]