require_relative "../test_helper"

class TaskTest < Minitest::Test
  def test_assigns_attributes_correctly
    task = Task.new({
      "id" => 1,
      "title" => "Test Title",
      "description" => "test description"
    })
    assert_equal(1, task.id)
    assert_equal("Test Title", task.title)
    assert_equal("test description", task.description)
  end
end
