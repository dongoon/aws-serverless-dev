# Local Environment Standards for Serverless Application Development
## Requirements
* [direnv](https://github.com/direnv/direnv)
* localstack
    * [dependencies](https://github.com/localstack/localstack#requirements)
    * **Pro version is required**

## Getting started
1. `cd [current this dir]`
1. Preapre .envrc file
    1. `cp ./.envrc_example ./.envrc`
    1. Fix `LOCALSTACK_API_KEY`
1. `direnv allow` # First time || .envrc updated
1. `make start`
