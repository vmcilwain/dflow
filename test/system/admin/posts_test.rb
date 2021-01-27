require "application_system_test_case"

class Admin::PostsTest < ApplicationSystemTestCase
  test 'as an administrator, I can create a post' do
    new_session admin_user

    visit new_post_path

    # click_link :Create

    # text = Faker::Lorem.paragraph
    # fill_in_rich_text_area 'about[body]', with: text

    # click_button 'Create About'

    # assert_success_alert
    # assert has_content? text
  end

  test 'as an administrator, I should be told why a post failed to create' do
    # new_session admin_user

    # visit about_page_path

    # click_link :Create

    # click_button 'Create About'

    # assert_error_alert
  end
end
