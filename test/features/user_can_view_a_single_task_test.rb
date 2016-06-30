require_relative '../test_helper'

class UserCanViewASingleTaskTest < FeatureTest

  def test_user_can_view_a_tasks_show_page
    task = task_manager.create({title: "HUH", description: "popcorn"})

    visit "/tasks/1"
    within("h1") do
      assert page.has_content?("HUH")
    end

    within("p") do
      assert page.has_content?("popcorn")
    end
  end
end
