# Myob Pre Interview App

[![Build status](https://badge.buildkite.com/24e853178664a8df7c65b7d6986123b7d7b2e466da21b093a9.svg)](https://buildkite.com/shuhuitest/myob-preinterview-app)

This a simple Ruby On Rails App with CI pipeline

## Getting Started

### Configure Dev Environment
This section is talking about how to configre your development environment. Follow the following steps:

1. Make sure `docker` and `docker-compose` are installed on your machine
2. In the project foloder, run `docker-compose build`. This script will build the docker image and install ruby gems. 
3. Run `docker-compose up`, which will launch the app on port 3000.

There are some other shell scripts for your development.

`./scripts/test.sh`: Run rubocop code analysis tool and all tests

### API definition

[swagger api definition](https://app.swaggerhub.com/apis/shuhui17/myob-pre-interview/1.0.0)


## Deployment

### Pipeline
For this app, I do pipeline as code using [buildkite](https://buildkite.com/shuhuitest/myob-preinterview-app). Because the buildkite pipeline does not allow public access, I attached the credential as below.

* username: shu.hui.test@gmail.com
* password: u2zgFVZ6a3Ai
* url: [https://buildkite.com/shuhuitest/myob-preinterview-app](https://buildkite.com/shuhuitest/myob-preinterview-app)


The pipleline starts from commit to master branch which is the conceptual release branch. There's different layers that I would be using when building pipelines:

* Pipeline definition (Buildkite pipeline.yml)
* Each pipeline step would call a Makefile target
* Scripts that the Makefile targets would call


#### Steps

1. `cleanup`: Stop and remove old containers and volumes.
2. `test`: Application basic packaging and unit tests.
3. `package`: Buid deployable artifact and upload it to docker hub.

After all these steps, the deployable artifact can be found in [here](https://hub.docker.com/r/shuhui18/myob-pre-interview/)

#### Buildkite Agent

I used buildkite official [cloudformation stack](https://github.com/buildkite/elastic-ci-stack-for-aws) to create a private, autoscaling Buildkite Agent cluster in my personal AWS account.

The Docker Hub credential (use to push docker images) is set up in the environment hook in a secrets s3 bucket.

## Potential Risks

### Code and Doker Images are in Public Repository

The souce code and docker images are in the pubic repositories (Github, Docker Hub) which is easy for other people to analyze and attack. In addition, I put the buildkite crendential in the README file as I want the reviewers have access to see the CI pipeline.

### AWS

Because the time is limit, I don't have enough time to setup AWS IAM role and permission for Buildkite agent. As a result, I gave buildkite agent Admin role which means anyone can control the building AWS account by following steps.

1. Add a hack script to install aws cli and run whatever scripts you want.
2. Add the hack script in the buildkite pipeline.
3. Push the commit to master branch.