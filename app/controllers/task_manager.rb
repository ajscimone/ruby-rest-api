require 'date'

class Task_Manager

    def initialize()
        task1 = { :id => 1, :title =>'Run Enery Plus', :description => 'Finish tweaking model for RTF or something like that', :done => false, :date => DateTime.now()  }
        task2 = { :id => 2, :title =>'Run Enery Plus Again', :description => 'Finish tweaking model for TRC?', :done => false, :date => DateTime.now()  }
        task3 = { :id => 3, :title =>'Run Enery Plus a third time', :description => 'I\'m out of ideas', :done => false, :date => DateTime.now()  }
        @tasks = [task1, task2, task3]
        @id_count = 3
    end
  
    def get_all_tasks()
        @tasks.to_json
    end

    def get_task(id)
        if id.is_a? Integer
            task = @tasks.select {|task| task[:id] == id }
            return task.to_json
        else
            return "Not Found".to_json
        end
    end

    def add_task(title, description="No description")
        task = {}
        if !title.is_a? String
            return "Error: A title string is required for a task"
        else
            task[:title] = title
        end
        @id_count +=1
        task[:id] = @id_count
        task[:description] = description
        task[:done] = false 
        task[:date] = DateTime.now()
        puts task
        @tasks.push(task)
        return @tasks.to_json
    end

    def update_task(id, title=nil, description=nil, done=nil)
        @tasks.each do |task|
            if task[:id] == id
                if title
                    task[:title] = title
                end
                if description
                    task[:description] = description
                end
                if done
                    task[:done] = done # this one not working
                end
            end
        end
        return @tasks.to_json
    end

    def delete_task(id)
        @tasks.delete_if {|task| task[:id] == id }
        return @tasks.to_json
    end
  end 




