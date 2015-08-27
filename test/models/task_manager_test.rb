require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    task = TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    task = TaskManager.find(task.id)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    # assert_equal 1, task.id
  end

  def test_it_finds_all_tasks
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.create({ :title       => "a second title",
                         :description => "a second description"})

    assert_equal 2, TaskManager.all.count
  end

  def test_it_finds_a_task_by_id
    task = TaskManager.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.create({ :title       => "a second title",
                         :description => "a second description"})

    assert_equal "a title", TaskManager.find(task.id).title
  end

  def test_it_updates_a_task
    task = TaskManager.create({ :title       => "a title",
                                :description => "a description"})

    assert_equal "a title", task.title
    task.title = "an updated title"
    TaskManager.update(task.id, task)

    assert_equal "an updated title", task.title
  end

  def test_it_deletes_a_task
    task = TaskManager.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.create({ :title       => "a second title",
                         :description => "a second description"})

    total = TaskManager.all.count
    TaskManager.delete(task.id)
    assert_equal (total - 1), TaskManager.all.count
  end
end
