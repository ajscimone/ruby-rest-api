<!--
# Test Strings

Create
curl -i -H "Content-Type: application/json" -X POST -d '{"title":"Walk", "description": "Take a walk"}' http://127.0.0.1:9393/task/new

Update
curl -i -H "Content-Type: application/json" -X PUT -d '{"title":"Finish this program", "description": "", "done":"true"}' http://localhost:9393/task/2

update

Delete
curl -i -H "Content-Type: application/json" -X DELETE http://localhost:9393/task/2

-->

# ruby-rest-api

A simple todos-like app built with Ruby, Sinatra used as the engine to generate the web functionality for the api, and ActiveRecord as an ORM for database persistence.

In order to get up and running:

1. Create a `development.sqlite` database file inside the `db/` folder and run the `Tasks.sql` file into it.
2. Install the necessary packages with `bundler install`.
3. Run `shotgun` to start the server.
