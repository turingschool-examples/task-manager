require_relative '../test_helper'

class UserCanDeleteATaskTest < FeatureTest

  def test_user_can_delete_a_tasks_show_page
    task = task_manager.create({title: "HUH", description: "popcorn"})

    visit "/tasks"

    assert_equal 1, task_manager.all.size

    find_button("delete").click

    assert_equal 0, task_manager.all.size

    assert "/tasks", current_path
    refute page.has_content?("HUH")
    refute page.has_content?("popcorn")
  end
end
