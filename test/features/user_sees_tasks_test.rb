require_relative "../test_helper"

class UserSeesTasksTest < FeatureTest

  def test_user_sees_index_of_tasks
    task1 = task_manager.create({
      title: "Coding Is Cool",
      description: "I Know It's Cool"
      })

    task2 = task_manager.create({
      title: "Learn Capybara",
      description: "Swim in Hottub to James Brown"
      })


    # As a user
    # when I visit the tasks index
    visit "/tasks"
    # Then I should see a list of my tasks and only their titles
    within("#task_list") do
      assert page.has_content?("Coding Is Cool")
      assert page.has_content?("Learn Capybara")
    end
  end
end
