require 'yaml/store'

class TaskManager
  def self.database
    @database ||=  YAML::Store.new('db/task_manager')
  end

  def self.create(task)
    database.transaction do
      database['tasks'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['tasks'] << { "id" => database['total'], "title" => task[:title], "description" => task[:description] }
    end
  end
end
