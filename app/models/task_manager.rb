class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    database.execute("INSERT INTO tasks (title, description) VALUES (?, ?);", task[:title], task[:description])
  end

  def raw_tasks
    database.execute("SELECT * FROM tasks;")
  end

  def all
    raw_tasks.map { |data| Task.new(data) }
  end

  def raw_task(id)
    database.execute("SELECT * FROM tasks WHERE id = ?", id).first
  end

  def find(id)
    Task.new(raw_task(id))
  end

  def update(id, task)
    database.execute("UPDATE tasks SET title= ?, description= ? WHERE id = ?;", task[:title], task[:description], id)
  end

  def destroy(id)
    database.execute("DELETE FROM tasks WHERE id = ?;", id)
  end

  def delete_all
    database.execute("DELETE FROM tasks;")
  end
end
