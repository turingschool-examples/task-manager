require_relative '../test_helper'

class UserEditTaskTest < FeatureTest
  def test_edits_task
    task_manager.create({ title: "Go to gym",
                         description: "get fit" })

    visit '/tasks'
    assert page.has_content?("Go to gym")
    find_link("Edit").click
    fill_in("task[title]", with: "Eat pizza")
    fill_in("task[description]", with: "now")
    click_link_or_button("Submit")

    assert_equal '/tasks/1', current_path
    refute page.has_content?("Go to gym")
    assert page.has_content?("Eat pizza")
  end
end
