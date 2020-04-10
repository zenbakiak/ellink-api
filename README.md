# README

This project is an assessment.

### Description

This is the API of the shortener URL created with Rails (backend) and ReactJS (frontend).

### How it works

It works by just parsing and extracting information from the URL you want to shrink, then we save this record in our database with a special shortcode, it is the parameter you will see in the URL, e.g. https://ell.ink/AcDR51o

The mentioned code bellow is based on combinations and permutations.

First, we generate a number based on current time (with milliseconds) and randomize our dictionary, which is a string composed by the alphabet in lower and upper case, as well as 0-9 digits, so, we have a total of 62 possible values in each position of our 7 length string

`abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890`

so, our method consists of a series of modulus from divisions of the generated number by the length of our alphabet

To achieve more complexity and reliability we could use libraries sich as `hashids` or `nanoid`, they achieve their results by implementing the Fisher-Yates shuffle algorithm

references:

https://hashids.org/

https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle

However, by taking advantage of ruby and the `Array#shuffle` method, we can gain time by not using the algorithm, just need to be sure the alphabet is shuffling every time we generate a code.

With that in mind, we have a nPr permutation whee n = 62, r = 7

62! / (62-7)! = 2.478652606E+12, = 2478652606080 possible ids.


To start application:

- Clone this repo
- `bundle install`

* Ruby version:

  ruby 2.6.5p114

* System dependencies:
  - Postgres.

* Database creation

  Ensure you have your `config/database.yml` file correctly,
  then run `rake db:create`

* Database initialization:

  `rake db:setup `*

  > \* this will create the database an run migrations and seeds.


* How to run the test suite

  `rspec`

  `rubocop` to check code offenses

  Also check for the `coverage/index.html` for a testing coverage report.


* To deploy on heroku:

  - `heroku create`

  - `git push heroku master`

  - `heroku run rake db:migrate`

## Author:

  [@zenbakiak](https://gitlab.com/zenbakiak)