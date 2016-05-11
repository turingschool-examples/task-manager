require_relative '../test_helper'

class TaskTest <Minitest::Test

  def test_assigns_attributes_correctly


    assert_equal "New Task", @task.title
    assert_equal "Task Description", @task.description
    assert_equal 1, @task.id
  end
end
