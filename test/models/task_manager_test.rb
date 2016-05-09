require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.new.create({ :title       => "a title",
                         :description => "a description"})
    task = TaskManager.new.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_it_finds_all_tasks
    TaskManager.new.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.new.create({ :title       => "a second title",
                         :description => "a second description"})

    assert_equal 2, TaskManager.new.all.count
  end

  def test_it_finds_a_task_by_id
    TaskManager.new.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.new.create({ :title       => "a second title",
                         :description => "a second description"})

    assert_equal "a title", TaskManager.new.find(1).title
  end

  def test_it_updates_a_task
    task = TaskManager.new.create({ :title       => "a title",
                                :description => "a description"})

    assert_equal "a title", task.first["title"]
    task.first["title"] = "an updated title"
    TaskManager.new.update(task.first["id"], task.first)

    assert_equal "an updated title", task.first["title"]
  end

  def test_it_deletes_a_task
    TaskManager.new.create({ :title       => "a title",
                         :description => "a description"})

    TaskManager.new.create({ :title       => "a second title",
                         :description => "a second description"})

    total = TaskManager.new.all.count
    TaskManager.new.delete(1)
    assert_equal (total - 1), TaskManager.new.all.count
  end
end
