require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    task = TaskManager.find(TaskManager.all.first.id)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal TaskManager.all.first.id, task.id
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

    assert_equal "a title", TaskManager.find(TaskManager.all.first.id).title
  end

  def test_it_updates_a_task
    task = TaskManager.create({ :title       => "a title",
                                :description => "a description"})

    TaskManager.update(task.id, {title: "new title", description: "new description"})

    assert_equal "new title", TaskManager.find(task.id).title
    assert_equal "new description", TaskManager.find(task.id).description
  end

  def test_it_deletes_a_task
    2.times do
      TaskManager.create({ :title       => "a title",
                           :description => "a description"})
    end

    total = TaskManager.all.count
    TaskManager.delete(TaskManager.all.first.id)
    assert_equal (total - 1), TaskManager.all.count
  end
end
