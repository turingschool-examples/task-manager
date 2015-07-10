require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_home_page_displays_welcome_message
    visit("/")
    assert page.has_content?("Task Manager")
    assert page.has_content?("Task Index")
    assert page.has_content?("New Task")
  end

  def test_home_page_renders_with_css
    visit("/")
    assert page.has_css?("body", "html")

    within(".container") do
      assert page.has_content?("Task Index")
    end
  end

  def creates_task
    visit("/")
    click_link("New Task")

    fill_in("task-title", with: "new task")
    fill_in("task-description", with: "new description")
    assert_equal "/tasks/new", current_path
    click_button("Create Task")
  end

  def test_user_can_fill_in_task_form
    creates_task
    assert_equal "/tasks", current_path

    within(".container") do
      assert page.has_content?("new task")
    end
  end

  def test_user_can_edit_a_task
    task = TaskManager.create(title: "Yo", description: "Yo")
    visit "/tasks"

    click_link("edit")

    fill_in("task-title", with: "new task edited")
    fill_in("task-description", with: "new description edited")
    click_button("Update Task")

    assert_equal "/tasks/#{task.id}", current_path
    within(".container") do
      assert page.has_content?("new task edited")
    end
  end

  def test_user_can_delete_a_task
    creates_task
    assert_equal "/tasks", current_path
    click_button("delete")

    refute page.has_content?("new task")
  end

  def test_a_user_can_see_a_single_task
    task = TaskManager.create(title: "Yo", description: "Yo")
    visit "/tasks"

    click_link("Yo")
    assert_equal "/tasks/#{task.id}", current_path
    assert page.has_content?("Yo")
  end
end
