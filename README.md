# ![RealWorld Example App](logo.png)

add prometheus. see master elixir chp

> Elixir (Phoenix) codebase containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld](https://github.com/gothinkster/realworld-example-apps) spec and API.  

[![CircleCI](https://circleci.com/gh/gothinkster/elixir-phoenix-realworld-example-app.svg?style=svg)](https://circleci.com/gh/gothinkster/elixir-phoenix-realworld-example-app) [![codecov](https://codecov.io/gh/gothinkster/elixir-phoenix-realworld-example-app/branch/master/graph/badge.svg)](https://codecov.io/gh/gothinkster/elixir-phoenix-realworld-example-app)

This codebase was created to demonstrate a fully fledged backend application built with **Elixir and Phoenix** including CRUD operations, authentication, routing, pagination, and more.

We've gone to great lengths to adhere to the **[credo](https://github.com/rrrene/credo)** community styleguides & best practices.

For more information on how to this works with other frontends/backends, head over to the [RealWorld](https://github.com/gothinkster/realworld) repo.

## Installing / Getting started

To run this project, you will need to install the following dependencies on your system:

* [Elixir](https://elixir-lang.org/install.html)
* [Phoenix](https://hexdocs.pm/phoenix/installation.html)
* [PostgreSQL](https://www.postgresql.org/download/macosx/)

To get started, run the following commands in your project folder:

```shell
cp config/dev.exs.example config/dev.exs  # creates the project's configuration file
mix deps.get  # installs the dependencies
mix ecto.create  # creates the database.
mix ecto.migrate  # run the database migrations.
mix phx.server  # run the application.
```

This is a backend project, you won't be able to go to localhost:4000 and see an aplication. 

In order to see the [Conduit](https://demo.realworld.io/#/) frontend you will need to download and setup one of the [frontend projects](https://demo.realworld.io/#/) and set it up to consume this apps api. Typically this can be done by finding the `API_URL` and setting it to `localhost:4000`.

## Tests

To run the tests for this project, simply run in your terminal:

```shell
mix test
```

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

### Working with a repo

mix ecto.create -r Cards.Repo

mix ecto.migrate -r Cards.Repo

mix ecto.drop -r Cards.Repo

Insert some sample data before write our api resource

Cards.Repo.insert!(%Cards.Schemas.Card{label: "Hello1"})

Seeding data

https://www.phoenixframework.org/blog/seeding-data
