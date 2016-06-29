require_relative "../test_helper"

class UserCanCreateATaskTest < FeatureTest

  def test_user_can_create_a_task
    # As a user
    # When I visit the dashboard
    visit "/"
    # And I click the link "create task"
    click_link "New Task"
    # Then I should be on the new tasks page
    assert_equal "/tasks/new", current_path
    # And I fill in the title field with "new task"
    fill_in "task[title]", with: "new task"
    # And I fill in the description field with "new description"
    fill_in "task[description]", with: "new description"
    # And I click the submit button
    click_button("Submit")
    assert_equal "/tasks", current_path
    # Then I should see the list of tasks and a All Tasks header
    assert page.has_css?("#title")
    assert page.has_content?("All Tasks")
  end

end
