<!--
# Test Strings

Create
curl -i -H "Content-Type: application/json" -X POST -d '{"id":4, "title":"Walk", "description": "Take a walk"}' http://127.0.0.1:9393/task/new

Update
curl -i -H "Content-Type: application/json" -X PUT -d '{"title":"Finish this program", "description": "" "done":true}' http://localhost:9393/task/2

update

Delete
curl -i -H "Content-Type: application/json" -X DELETE http://localhost:9393/api/delete/2

http://127.0.0.1:9393/task/1
-->
