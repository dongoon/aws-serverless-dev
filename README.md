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
### Sandbox by ruby script
Requirements: ruby ver => `./sandbox_ruby/.ruby-version`
1. `cd ./sandbox_ruby`
1. `bundle install`

## SES
### ruby
`pry`
```erbruby
require 'aws-sdk-ses'
client = Aws::SES::Client.new(region: 'us-west-2', endpoint: 'http://localhost:4579')
client.verify_email_identity(email_address: 'sender@example.com')
client.send_email(
  destination: {
    to_addresses: ['to-you.@example.com']
  },
  message: {
    body: {
      text: {
        data: 'test body message'
      }
    },
    subject: {
      data: 'test mail'
    }
  },
  source: 'sender@example.com'
)
```
