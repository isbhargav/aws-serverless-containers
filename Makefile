AWS_DEFAULT_REGION="us-west-2"

ecr-login:
	docker login -u AWS -p $(aws ecr get-login-password --region $AWS_DEFAULT_REGION) $(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com

build-locally-api-lambda:
	docker build -t my-node-app .
	docker run -p 8080:8080 my-node-app

# Build image locally for testing
build-local-test-async-lambda:
	docker build -t async-image-lambda:test -f DockerfileAsync .
	docker run --platform linux/amd64 -p 9000:8080 async-image-lambda:test

#invokes the function with an event
invoke-with-event:
	curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"payload":"hello world!"}'

build:
	sam build

deploy:
	sam deploy --resolve-image-repos
