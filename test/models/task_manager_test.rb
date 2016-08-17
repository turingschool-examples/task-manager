require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers
  def test_it_creates_a_task
    task_manager.create({
      :title => "some title",
      :description => "My description"
    })
    task = task_manager.find(1)
    assert_equal("some title", task.title)
    assert_equal(1, task.id)
    assert_equal("My description", task.description)
  end
end
