# require 'yaml/store'

class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/task_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/task_manager_development.sqlite3")
    end
  end

  def self.create(task)
    begin
      dataset.insert( title:       task[:title], description: task[:description])
    rescue
      return false
    end

    Task.new(dataset.to_a.last)
  end

  def self.all
    dataset.to_a.map { |data| Task.new(data) }
  end

  def self.find(id)
    Task.new(dataset.where(id: id).first)
  end

  def self.update(id, task={})
    dataset.where(id: id).update(task)
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
end
