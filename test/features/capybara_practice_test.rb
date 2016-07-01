require_relative "../test_helper"

class CapybaraPracticeTest < FeatureTest

  def test_practice_finding_scoped_content
    # as a user
    # When I go to the '/capybara_practice' page
    # I should see "This p is nested within a div this the class .content" scoped to a div that has a class of .content
    # and I should see "this is another p nested within the .content div" scoped to a div that has a class of .content
  end

  def test_user_can_go_to_my_robot_index_from_the_practice_page
    # as a user
    # When I go to the '/capybara_practice' page
    # And I click the link to see 'All Tasks' in the first paragraph on the page
    # I should be taken to the tasks index page
    # and I should see the title "All Tasks"
  end

  def test_user_can_submit_data_through_the_form_and_see_it_on_the_other_page
    # as a user
    # when i go the '/capybara_practice' page
    # and I fill in the tasks title with "task1"
    # and I fill in the tasks description with 'description1'
    # and i select medium from the dropdown
    # and i select incomplete from the checkbox
    # and i click submit
    # then i should be on the '/practice_show' page
    # and i should see the the task title i entered
    # and i should see the the task description i entered
    # and i should see the the task medium i entered
    # and i should see the the task incomplete i entered
  end

  def test_user_find_ordered_information_in_a_list
    # as a user
    # when i go the '/capybara_practice' page
    # I should find a list with an id of #practice_list
    # I should find the content "First in list" for as the first item in the list
    # I should find the content "Second in list" for as the second item in the list
    # I should find the content "third in list" for as the third item in the list
    # I should find the content "fourth in list" for as the fourth item in the list
    # I should find the content "fifth in list" for as the fifth or last item in the list
  end

  def test_user_can_click_link_in_first_list_item
    # as a user
    # when i go the '/capybara_practice' page
    # I should find a list with an id of #practice_list
    # and when I click on the link "All Tasks"
    # I should be taken to the tasks index page
  end

end
