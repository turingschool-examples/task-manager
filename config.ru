require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/app"))

require 'controllers/task_manager_app'

run TaskManagerApp
