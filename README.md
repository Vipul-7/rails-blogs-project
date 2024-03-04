# README

* Ruby version - 3.2.1

# Run on local

- Install ruby using rvm on your local machine
- Install rails using gem on your local machine
- Install postgresql on your local machine

- Clone the repository
- Run `bundle install` to install all the dependencies
- [database.yml](config/database.yml) is configured to use postgresql, enter your postgresql username and password
- Run `rails db:create` to create the database
- Run `rails db:migrate` to run the migrations
- Run `bin/dev` to start the server 
- Open `http://localhost:3000` in your browser

Note :- I didn't more focus on UI, I just focused on the functionality of the application.