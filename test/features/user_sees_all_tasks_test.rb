require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest
include Capybara::DSL
  def test_user_sees_all_tasks
    task_manager.create({title: "Title1", description: "Description1"})
    task_manager.create({title: "Title2", description: "Description2"})

    visit '/tasks'
save_and_open_page
    assert page.has_content?("(1) Title1")
    assert page.has_content?("(2) Title2")
  end

end
