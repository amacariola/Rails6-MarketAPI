# Market Place API
Ill add a Dockerfile to make this application run on a containerized setup, yah Docker

~~~~~~~
Routes

       Prefix        Verb         URI Pattern                                                                                     
 api_v1_users        POST       /api/v1/users(.:format)                                                                         
 api_v1_user         GET       /api/v1/users/:id(.:format)                                                                       
                     PATCH     /api/v1/users/:id(.:format)                                                                       
                     PUT       /api/v1/users/:id(.:format)                                                                       
                     DELETE    /api/v1/users/:id(.:format)                                                                       
 api_v1_orders       GET       /api/v1/orders(.:format)                                                                          
                     POST      /api/v1/orders(.:format)                                                                         
 api_v1_order        GET       /api/v1/orders/:id(.:format)                                     
 api_v1_tokens       POST      /api/v1/tokens(.:format)                                                                          
~~~~~~~~~



## Setup

~~~bash
$ bundle install
$ rake db:create && rake db:migrate
~~~

## Run the test with pride 
~~~bash
$ rails test --pride
~~~

## Repopulate the database
~~~bash
$rake db:seed
~~~~

## Perform tests

# Create a new user
~~bash
$ curl -X POST --data "user[email]=new@email.com" --data "user[password]=test1234" http://localhost:3000/api/v1/users

Response:
{"data":{"id":"10","type":"user","attributes":{"email":"new@email.com"},"relationships":{"products":{"data":[]}}}} 

# Get Auth token

$ curl -X POST --data "user[email]=new@email.com" --data "user[password]=test1234" http://localhost:3000/api/v1/tokens

# Fetch all products 

$ curl --header "Authorization = token here" http://localhost:3000/api/v1/products

## Requirements

- Ruby 2.7+(Rails 6.1.x)
- Sqlite3
