require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_manager.create({title: "TDD", description: "Learn to test"})

    task = task_manager.find(1)
    assert_equal "TDD", task.title
    assert_equal "Learn to test", task.description
    assert_equal 1, task.id
  end

  def  test_it_can_find_all_tasks
    task_manager.create({title: "TDD", description: "Learn to test"})
    task_manager.create({title: "TDD1", description: "Learn to test1"})

    tasks = task_manager.all

    assert_equal 2, tasks.size
    assert_equal "TDD", tasks.first.title
    assert_equal "Learn to test", tasks.first.description
  end

  def test_it_can_find_a_single_task
    task_manager.create({title: "TDD", description: "Learn to test"})

    task = task_manager.find(1)

    assert_equal "TDD", task.title
    assert_equal "Learn to test", task.description
  end

  def test_it_can_update_a_task
    task_manager.create({title: "TDD", description: "Learn to test"})

    task_manager.update(1, {title: "UPDATED TITLE", description: "New Description"})

    task = task_manager.find(1)

    assert_equal "Not TDD", task.title
  end

  def test_it_can_destroy_a_task
    task_manager.create({title: "TDD", description: "Learn to test"})

    assert_equal 1, task_manager.all.size

    task_manager.destroy(1)

    assert_equal 0, task_manager.all.size
  end
end
