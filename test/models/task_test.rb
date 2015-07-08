require_relative '../test_helper'

class TaskTest < Minitest::Test
  def test_assigns_attributes_correctly
    task = Task.new({ "title"       => "a title",
                      "description" => "a description",
                      "id"          => 1 })
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end
end