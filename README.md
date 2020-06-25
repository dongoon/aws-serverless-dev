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
    1. Fix `LOCALSTACK_API_KEY`, `L_AWS_ACCESS_KEY`, `L_AWS_SECRET_KEY`, `SMTP_xxxx`
1. `direnv allow` # First time || .envrc updated
1. `make init`
### Development console
`make login`

## SES
### ruby
```
local     > make login
devserver $ pry
```
↓
```erbruby
require 'aws-sdk-ses'
client = Aws::SES::Client.new(endpoint: 'http://localstack:4579')
client.verify_email_identity(email_address: 'sender@example.com')
client.send_email(
  destination: {
    to_addresses: ['to-you@example.com']
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
