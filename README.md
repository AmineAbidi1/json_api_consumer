# json_api_consumer

A basic Rails application that consumes a RESTful API

## Introduction

The purpose of this project is to consume a public API secured with a unique API KEY through a Rails application.

The communication with the server is done via a SHA1 hashkey generated through a set of params.

The most important part of this project, the HTTP communication with this the server and the response handling, is being done through the HTTP client lib Faraday https://github.com/lostisland/faraday.


## Installation

clone the repo:
```ruby
git clone git@github.com:AmineAbidi1/json_api_consumer.git
```

then execute:

```ruby
$ bundle install
```

to setup the database for the development environment run:
```ruby
rake db:migrate
```

to setup the database for the test environment run:
```ruby
rake db:migrate RAILS_ENV=test
```
## Running the test suits

```ruby
bundle exec rspec
```
## Usage

First run:

```ruby
rails server
```
Then go to: http://0.0.0.0:3000/

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
