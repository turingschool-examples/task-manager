require 'yaml/store'
require_relative 'task'

class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    database.transaction do
      database['tasks'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['tasks'] << { "id" => database['total'], "title" => task[:title], "description" => task[:description] }
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
