ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'launchy'
require 'sqlite3'

module TestHelpers
  def teardown
    task_manager.delete_all
    super
  end

  def task_manager
    database = SQLite3::Database.new('db/task_manager_test.db')
    database.results_as_hash = true
    TaskManager.new(database)
  end
end


Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
