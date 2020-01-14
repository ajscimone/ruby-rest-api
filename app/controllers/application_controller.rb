require 'date'
require './config/environment'

class ApplicationController < Sinatra::Base

  @@task1 = { :id => 1, :title =>'Run Enery Plus', :description => 'Finish tweaking model for RTF or something like that', :done => false, :date => DateTime.now()  }
  @@task2 = { :id => 2, :title =>'Run Enery Plus Again', :description => 'Finish tweaking model for TRC?', :done => false, :date => DateTime.now()  }
  @@task3 = { :id => 3, :title =>'Run Enery Plus a third time', :description => 'I\'m out of ideas', :done => false, :date => DateTime.now()  }
  @@tasks = [@@task1, @@task2, @@task3] 

  get "/" do
    'Hello world'
  end

  get "/task/all" do
    @@tasks.to_json
  end

  get "/task/:id" do
    @id = params[:id]
    @task = @@tasks.find {|task| task[:id] == @id.to_i }
    @task.to_json
  end

  post "/task/new" do
    @new_task = { :id => params[:id].to_i, :title =>params[:title], :Description => params[:description], :done => false, :date => DateTime.now()  }
    #@@tasks.push(@new_task)
    @@tasks << @new_task
    puts @@tasks
    "Success\n"
  end

  put '/task/:id' do
    @id = params[:id]
    #@task = @@tasks.find {|task| task[:id] == @id.to_i }
    #@task.update(@task) { |key, value| value = params[:key]}
    #@task.update (:description => params[:description])
    #S@task.update (:done => params[:done])
    @task = { :id => params[:id].to_i, :title => params[:title], :description => params[:description], :done => params[:done], :date => DateTime.now()  }
    @@tasks[params[:id].to_i] = @task
    @task.to_json
  end

end
