require 'yaml/store'

class TaskManager
  def database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= YAML::Store.new("db/task_manager_test")
    else
      @database ||= YAML::Store.new("db/task_manager")
    end
  end

  def create(task)
      database.transaction do
        database['tasks'] ||= []
        database['total'] ||= 0
        database['total'] += 1
        database['tasks'] << { "id" => database['total'],
                              "title" => task[:title],
                              "description" => task[:description] }
    end
  end

  def raw_tasks
    database.transaction do
      database['tasks'] || []
    end
  end

  def all
    raw_tasks.map { |data| Task.new(data) }
  end

  def raw_task(id)
    raw_tasks.find { |task| task["id"] == id }
  end

  def find(id)
    Task.new(raw_task(id))
  end
end
