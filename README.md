# ML1
**My practice repo.
**
It concentrates only on simple model deployment on aws serverless.

Target is to deploye the model and use the model for POC(prof of concept) with 0 cost.

# 1: Create aws account, login to account.

# 2: Create then open Cloud9 IDE

AWS Cloud9 is a cloud-based integrated development environment (IDE) that lets you write, run, and debug your code with just a browser. It includes a code editor, debugger, and terminal.

![image](https://user-images.githubusercontent.com/17021017/147494006-da1b51c4-eaa4-4ba6-b429-a21c61979082.png)

# 3:clone this project to Cloud9 IDE



# 3:lambda_function.py file explanation

![image](https://user-images.githubusercontent.com/17021017/147608404-b0e8aaf5-9a8c-4e02-9f9a-9e0e4bfa2a8a.png)

AWS Lambda function execution starts from **lambda_handler** method.

event parameter takes the JSON string.

Loads the model using joblib.

predcit the value of salary then return it.

# 4: Dockerfile explanation

![image](https://user-images.githubusercontent.com/17021017/147608701-549c4034-214a-4735-8334-30fb940a7085.png)

1. The **FROM** instruction initializes a new build stage and sets the Base Image for subsequent instructions. As such, a valid Dockerfile must start with a FROM instruction. The image can be any valid image – it is especially easy to start by pulling an image from the Public Repositories
2. The **RUN** instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile 
3. The **COPY** instruction lets us copy a file (or files) from the host system into the image.
4. There can only be one **CMD** instruction in a Dockerfile . If you list more than one CMD then only the last CMD will take effect. The main purpose of a CMD is to provide defaults for an executing container.

## Now build the image

Run the below commad

$docker build -t simple-linear-regression .

Docker image created with the simple-linear-regression name






