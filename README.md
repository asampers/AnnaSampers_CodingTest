# AnnaSampers_CODING TEST

This is an Item model with attributes name(string) and deleted_at(datetime). Its default scope includes only items where deleted_at == nil. The model has #soft_delete and #restore methods.

## Features

#soft_delete is an instance method that can be called on an Item object to update its deleted_at attribute to be the current timestamp.

#restore is an instance method that can be called on an Item object to update its deleted_at attribute to be nil.

## Local Installation

To run locally, you must have the following prerequisites:

```
Ruby >= 3.1.2
Rails >= 7.0.8
```

- Clone this repo `git clone https://github.com/asampers/AnnaSampers_CodingTest.git`
- Navigate into this project's directory `cd AnnaSampers_CodingTest`
- Install the required gems, by running `bundle install`
- Setup the database, by running `rails db:setup`
- Start the local server, by running `bin/rails server`
- View by visiting `localhost:3000` in a web browser

## Running the tests

- To run the entire test suite: `rspec`
- You can specify one spec folder to run a group of tests, such as: `rspec spec/models`
- You can specify one spec folder to run a single set of tests, such as: `rspec spec/models/item_spec.rb`

## Contact

Anna Sampers - [LinkedIn](https://linkedin.com/in/anna-sampers) - annasampers@gmail.com
