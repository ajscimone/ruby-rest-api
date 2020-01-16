require 'date'

class Task_Manager

    def initialize()
    end
  
    def get_all_tasks()
        tasks = Task.all()
        tasks.to_json
    end

    def get_task(id)
        if id.is_a? Integer
            task = Task.find_by(id: id)
            return task.to_json
        else
            return "ID error".to_json
        end
    end

    def add_task(title, description="No description")
        if !title.is_a? String
            return "Error: A title string is required for a task"
        end
        task = Task.create(title: title, description: description, done: false, date: DateTime.now())
        return task.to_json
    end

    def update_task(id, title=nil, description=nil, done=nil)
        task = Task.find_by(id: id)
        if title and title.is_a? String
            task.title = title
        end
        if description and description.is_a? String
            task.description = description
        end
        if done
            task.done = ActiveRecord::Type::Boolean.new.type_cast_from_user(done)
        end
        task.save
        return task.to_json
    end

    def delete_task(id)
        if Task.exists?(id: id)
            task = Task.find_by(id: id)
            task.destroy
            return "Success".to_json
        else
            return "Task not found".to_json   
        end
    end
  end 




