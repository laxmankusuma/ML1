# ML1
**My practice repo.**

It concentrates only on simple model deployment on aws serverless.

Target is to deploye the model and use the model for POC(prof of concept) with 0 cost.

# 1: Create aws account, login to account.

# 2: Create then open Cloud9 IDE

AWS Cloud9 is a cloud-based integrated development environment (IDE) that lets you write, run, and debug your code with just a browser. It includes a code editor, debugger, and terminal.

![image](https://user-images.githubusercontent.com/17021017/147494006-da1b51c4-eaa4-4ba6-b429-a21c61979082.png)

# 3:clone this project to Cloud9 IDE

![image](https://user-images.githubusercontent.com/17021017/147609204-eff7d93e-a3bb-4bbe-a378-c5144e41224f.png)


# 4:lambda_function.py file explanation

![image](https://user-images.githubusercontent.com/17021017/147608404-b0e8aaf5-9a8c-4e02-9f9a-9e0e4bfa2a8a.png)

AWS Lambda function execution starts from **lambda_handler** method.

event parameter takes the JSON string.

Loads the model using joblib.

predcit the value of salary then return it.

# 5: Dockerfile explanation

![image](https://user-images.githubusercontent.com/17021017/147608701-549c4034-214a-4735-8334-30fb940a7085.png)

1. The **FROM** instruction initializes a new build stage and sets the Base Image for subsequent instructions. As such, a valid Dockerfile must start with a FROM instruction. The image can be any valid image – it is especially easy to start by pulling an image from the Public Repositories
2. The **RUN** instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile 
3. The **COPY** instruction lets us copy a file (or files) from the host system into the image.
4. There can only be one **CMD** instruction in a Dockerfile . If you list more than one CMD then only the last CMD will take effect. The main purpose of a CMD is to provide defaults for an executing container.

# 6: build the image

Run the below commad

$docker build -t simple-linear-regression .

Docker image created with the simple-linear-regression name

![image](https://user-images.githubusercontent.com/17021017/147609380-ed34386f-5705-4665-9f14-cbbce6ac5e71.png)

# 7:Publishing to ECR(Elastic Container Registry)

Create an ECR repo: (My repo name : lambda-images )

$aws ecr create-repository --repository-name lambda-images

![image](https://user-images.githubusercontent.com/17021017/147504857-12b874f3-cdd5-4f73-b4a5-b70fc70e826f.png)

You can create/view from console

![image](https://user-images.githubusercontent.com/17021017/147507039-73ba2c5b-4495-4512-b5e0-fda1c11fdc35.png)

Now login to docker then publish the image to ECR(Elastic Container Registry).

$ $(aws ecr get-login --no-include-email)

**Note: dont forget dollar symbol($)**

![image](https://user-images.githubusercontent.com/17021017/147506878-88c322c3-5cc8-4c5a-a428-f45f14cbc73a.png)

Publish the image:

* REGION=ap-south-1
* ACCOUNT=634678741908
* REMOTE_NAME=${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/lambda-images:simple-linear-regression
* docker tag simple-linear-regression ${REMOTE_NAME}
* docker push ${REMOTE_NAME}

Change REGION with your region and ACCOUNT with your ACCOUNT ID 

![image](https://user-images.githubusercontent.com/17021017/147504359-d5ca59c4-9028-45a6-a8c5-aa013225777c.png)

![image](https://user-images.githubusercontent.com/17021017/147609761-00b608f2-3c2e-40a6-a511-6d1ccea2fdba.png)

Now you can See the same image in the ECR console also.

![image](https://user-images.githubusercontent.com/17021017/147609824-d84796a8-ad0f-45c6-9aba-16c53a3f8018.png)

# 8: Create a lambda function

![image](https://user-images.githubusercontent.com/17021017/147609896-82cd7de0-296d-4259-8b72-41109353c189.png)

![image](https://user-images.githubusercontent.com/17021017/147609915-6f73cac9-4a63-4406-a0b6-e9bf7c7bc7ad.png)

![image](https://user-images.githubusercontent.com/17021017/147609933-024252ea-de50-4a53-b3e6-742622bc2194.png)

![image](https://user-images.githubusercontent.com/17021017/147610012-00bd4fe3-d339-43da-a8fb-06eb2c684025.png)

![image](https://user-images.githubusercontent.com/17021017/147610062-54a09bfe-6893-4b91-ab45-bcf90f9aba14.png)

![image](https://user-images.githubusercontent.com/17021017/147610144-d2654ecd-c0dd-4a95-bd03-5529e6f3e46f.png)

Increase the memory and timeout

![image](https://user-images.githubusercontent.com/17021017/147610177-40f76dc0-091c-4d3f-9c69-b073240f6a9d.png)

### Test the lambda function by passing value

![image](https://user-images.githubusercontent.com/17021017/147610354-bc66383a-2985-4578-b133-f29c049e4902.png)

### Results:

![image](https://user-images.githubusercontent.com/17021017/147610380-a8af0f7f-ec0f-4ac3-8ebd-ac0f4f989288.png)

# 9: Invoke the Lambda function from the API Gateway

![image](https://user-images.githubusercontent.com/17021017/147610566-e8ed3fbd-e599-4b24-a989-b0db721b7407.png)

![image](https://user-images.githubusercontent.com/17021017/147610605-2f6ff9e8-f613-48cd-a7ba-15fbb2dbe757.png)

![image](https://user-images.githubusercontent.com/17021017/147610636-21d0ddd0-c14a-4ed0-b8bf-e6273eede375.png)

![image](https://user-images.githubusercontent.com/17021017/147610669-d5261f7c-6079-4de7-92d3-96bbaf781c0a.png)

![image](https://user-images.githubusercontent.com/17021017/147610688-8e0ebb87-993e-4fd9-b5c2-a6f33ee4e7eb.png)

![image](https://user-images.githubusercontent.com/17021017/147610721-b48e1584-0ff7-4130-b334-e43359105d1e.png)

![image](https://user-images.githubusercontent.com/17021017/147610750-bfdc0329-5a6e-4795-b482-091e6af6f8c6.png)

![image](https://user-images.githubusercontent.com/17021017/147610833-64179a16-8a99-4bbb-bec1-a4cbed658de6.png)

then press the right botton then itwill becomegreen.

![image](https://user-images.githubusercontent.com/17021017/147610880-051232ec-f9c1-4b09-9762-67a803dd0232.png)

![image](https://user-images.githubusercontent.com/17021017/147610900-d961231b-0388-423b-a811-bc20fd55b2be.png)

**test**

![image](https://user-images.githubusercontent.com/17021017/147610932-e55e1cda-949e-4d75-b033-a6aeeab293c6.png)

**output**

![image](https://user-images.githubusercontent.com/17021017/147610957-362eb7c2-d81a-42f4-8e08-8d36ca7a38f9.png)

testing is done ,now deploy the API

![image](https://user-images.githubusercontent.com/17021017/147611000-78a71ed1-7da6-46ff-97d1-78897072b626.png)

![image](https://user-images.githubusercontent.com/17021017/147611019-8f3ef23b-1663-4b25-9548-4c401fc24d6b.png)

![image](https://user-images.githubusercontent.com/17021017/147611034-6d4f39f4-ec9b-424c-b614-6638447fb303.png)


# 10: Test with RESTer or postman

To know url, goto lambda then click on API Gateway.

![image](https://user-images.githubusercontent.com/17021017/147611217-7dbab51b-0c50-463d-8c49-76158b95d23a.png)

url is 

 https://e8o54zst15.execute-api.ap-south-1.amazonaws.com/beta/prediction
 
 Now test with RESTer or postman
 
 ![image](https://user-images.githubusercontent.com/17021017/147611556-df2227ba-c4cd-4d60-a453-53506765f792.png)

# THANK YOU







