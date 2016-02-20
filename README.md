#docker-aws

A docker container for running SparkleFormation

Create .awsrc
---
	$ vim ~/.awsrc

	export AWS_ACCESS_KEY_ID=<aws_access_key_id>
	export AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>
	export AWS_REGION=us-east-1

Usage
---
	$ make container
	$ make run
