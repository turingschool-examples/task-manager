require 'yaml/store'
require 'sequel'

class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/task_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/task_manager.sqlite3")
    end
  end

  def self.create_table
    database.create_table :tasks do
      primary_key :id
      String :title
      String :description
    end
  end

  def self.create(task)
    @tasks = dataset
    id = @tasks.insert({ "title" => task[:title],
                         "description" => task[:description] })
    find(id)
  end

  def self.all
    raw_tasks = dataset.all
    raw_tasks.map { |data| Task.new(data) }
  end

  def self.find(id)
    raw_task = dataset.where(id: id).first
    Task.new(raw_task)
  end

  def self.update(id, task)
    dataset.where(id: id).update(title: task.title,
                                 description: task.description)
  end

  def self.delete(id)
    dataset.where(id: id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database.from(:tasks)
  end
  private_class_method :dataset
end
