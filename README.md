# Forms Core App

Based on existing work for a REST API called Romulus. See github.com/haighis/romulus_app Romulus App that provides account registration feature for Romulus Mesagging Application. Romulus Mesagging Application is a Slack/Whatsapp application that can handle 5 million simultaneous users.

## Installing / Getting started

To run this project, you will need to install the following dependencies on your system:

* [Elixir](https://elixir-lang.org/install.html)
* [Phoenix](https://hexdocs.pm/phoenix/installation.html)
* [PostgreSQL](https://www.postgresql.org/download/macosx/)

To get started, run the following commands in your project folder:

```shell
You need the forms core database. Talk to a member of the forms team for this.
mix deps.get  # installs the dependencies
mix phx.server  # run the application.
OR
iex -S mix phx.server # run the application in iex
```

This is a backend project, you won't be able to go to localhost:4000 and see an aplication. 

You can use postman and make a GET request to http://localhost:4000/datasources with a request header that has parameter business with value 1111

## Documentation

To generate the documentation, your can run in your terminal:

```shell
mix docs
```

This will generate a `doc/` directory with a documentation in HTML. To view the documentation, open the `index.html` file in the generated directory.

### Ecto Docs

https://hexdocs.pm/ecto/Ecto.html

### Stop postgresql

brew services stop postgresql

### Start postgresql in docker

docker run --name some-postgres -p 5432:5432 -v postgres-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres -d postgres

### Help with Docker & Postgres

https://markheath.net/post/exploring-postgresql-with-docker


Insert some sample data before write our api resource

Romulus.Repo.insert!(%Romulus.Todo{item: "Hello1"}) 

Add a new column to todo table with an ecto migration

Romulus.Repo.insert!(%Romulus.Todo{item: "Hello1", title: "test"}) 

Seeding data

https://www.phoenixframework.org/blog/seeding-data

## Deployment

exrm - todo research this
Dockerize and deploy to alpha environment