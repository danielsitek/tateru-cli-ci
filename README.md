# tateru-cli-ci

[![GitHub Actions](https://img.shields.io/badge/CI-GitHub%20Actions-blue.svg?logo=github)](https://github.com/danielsitek/tateru-cli-ci/actions)
[![GitLab Actions](https://img.shields.io/badge/CI-GitLab%20Pipelines-blue.svg?logo=gitlab)](https://gitlab.com/danielsitek/tateru-cli-ci/pipelines)
[![npm](https://img.shields.io/npm/v/tateru-cli)](https://www.npmjs.com/package/tateru-cli)

tateru-cli-ci is repository dedicated only to CI and running tests in various enviroments for [tateru-cli](https://www.npmjs.com/package/tateru-cli).

## CI stats

| Service          | Config file    | Status                                                                                                                                                                                                                     |
| ---------------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GitLab Pipelines | .gitlab-ci.yml | [![pipeline status](https://gitlab.com/danielsitek/tateru-cli-ci/badges/master/pipeline.svg)](https://github.com/danielsitek/tateru-cli-ci/blob/master/.gitlab-ci.yml)                                                     |
| GitHub Actions   | ci.yml         | [![tateru-cli-ci dev status](https://github.com/danielsitek/tateru-cli-ci/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/danielsitek/tateru-cli-ci/blob/master/.github/workflows/ci.yml)            |
| GitHub Actions   | ci-prod.yml    | [![tateru-cli-ci prod status](https://github.com/danielsitek/tateru-cli-ci/actions/workflows/ci-prod.yml/badge.svg?branch=master)](https://github.com/danielsitek/tateru-cli-ci/blob/master/.github/workflows/ci-prod.yml) |

## Docker runners

```
docker build -f Dockerfile.node10 --target dev -t tateru-cli-node10-dev:v1 .
docker build -f Dockerfile.node10 --target prod -t tateru-cli-node10-prod:v1 .

docker run tateru-cli-node10-dev:v1
docker run tateru-cli-node10-prod:v1
```

```
docker build -f Dockerfile.node12 --target dev -t tateru-cli-node12-dev:v1 .
docker build -f Dockerfile.node12 --target prod -t tateru-cli-node12-prod:v1 .

docker run tateru-cli-node12-dev:v1
docker run tateru-cli-node12-prod:v1
```
