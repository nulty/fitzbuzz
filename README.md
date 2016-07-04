# fitzbuzz

## Description

Rails application to provide fizzbuzz from 1 to 1 billion with API

Application has been designed so we do not have to create the FizzBuzz values up front. When a fizzbuzz that has not been calculated is requested, we create it on the fly and return it. It is essentially cached tehn when it's persisted in the database.

## Ruby Version
2.1.5 (Set in .ruby-version)

## Dependencies

See Gemfile
PostgreSQL datastore

## Setup:

 - Configure your postgres database in config/database.yml
 - start 
`$ rails s`

## Testing
tests are written in RSpec

run `rspec` to run the tests

## Submission

The API is not complete. 
 - authentication is missing
 - post requests have not been implemented

The API is not tested yet. Some difficulties in dependencies meant that this has not been done.
