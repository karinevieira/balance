## Settings

### Requirements
Make sure you have the following dependencies installed:
* [Ruby](https://www.ruby-lang.org) 3.2.2
* [Docker + Compose](https://www.docker.com)
* libpq

libpq is used to execute PostgreSQL commands without having to install the complete database, as the database server is a service that runs in Docker and not on your local machine.

### Setting up
Clone the balance repository:
```sh
git clone git@github.com:karinevieira/balance.git
cd balance
```
Run the following command:
```sh
bin/setup
```

This command installs the Ruby and Javascript dependencies, uploads the services and recreates the database. Check the `bin/setup` file to see details of its operation.

To start the application server, execute:
```sh
rails s
```
The application will be available at [http://localhost:3000](http://localhost:3000)

### Static code analyzer
```sh
bundle exec rubocop
```
### Tests
To run all tests:
```sh
bundle exec rspec
```
