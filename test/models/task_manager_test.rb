require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    task = TaskManager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_it_finds_all_tasks
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.create({ :title       => "a second title",
                         :description => "a second description"})

    assert_equal 2, TaskManager.all.count
  end

  def test_it_finds_a_task_by_id
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.create({ :title       => "a second title",
                         :description => "a second description"})

    assert_equal "a title", TaskManager.find(1).title
  end

  def test_it_updates_a_task
    task = TaskManager.create({ :title       => "a title",
                                :description => "a description"})

    assert_equal "a title", task.first["title"]
    task.first["title"] = "an updated title"
    TaskManager.update(task.first["id"], task.first)

    assert_equal "an updated title", task.first["title"]
  end

  def test_it_deletes_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.create({ :title       => "a second title",
                         :description => "a second description"})

    total = TaskManager.all.count
    TaskManager.delete(1)
    assert_equal (total - 1), TaskManager.all.count
  end
end