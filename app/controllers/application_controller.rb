require './app/controllers/task_manager'
require './config/environment'

class ApplicationController < Sinatra::Base
  
  @@tasks = Task_Manager.new()

  get "/" do
    'Hello world'
  end

  get "/task/all" do
    tasks = @@tasks.get_all_tasks()
  end

  get "/task/:id" do
    id = params[:id]
    task = @@tasks.get_task(id.to_i)
  end

  post "/task/new" do
    task_params = JSON.parse(request.body.read)
    response = @@tasks.add_task(task_params["title"], task_params["description"])
  end

  put '/task/:id' do
    id = params[:id]
    task_params = JSON.parse(request.body.read)
    @@tasks.update_task(id.to_i, task_params["title"], task_params["description"], task_params["done"])
  end

  delete '/task/:id' do
    id = params[:id]
    @@tasks.delete_task(id.to_i)
  end
end

# In order to run this program as a script, uncomment the following line:
# run ApplicationController.run!

#   Sinatra note:
#     The current scaffolding of this project is set up to not run an instance of Application Controller class, but instead to use the class definition object
#     defined above. Thus, the @@ is needed for any persistant variables since any instance variables will not get made (because an instance is never created)
#