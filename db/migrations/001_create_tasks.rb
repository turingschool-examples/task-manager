require 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
	database = SQLite3::Database.new("db/task_manager_#{env}.db")
	database.execute("CREATE TABLE tasks (
										id INTEGER PRIMARY KEY AUTOINCREMENT,
										title VARCHAR(64),
										description VARCHAR(64)
									);")
	puts "creating the database for #{env}"
end