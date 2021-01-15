require 'application_system_test_case'

class AboutsTest < ApplicationSystemTestCase
  test 'as a visitor, I can view About without a title' do
    body = Faker::Lorem.words(number: 5).join("\s")

    create :about, body: body

    visit about_page_path

    assert_not has_css? 'header h1'
    assert_not has_link? :Create
    assert_not has_link? :Edit
    assert has_link? :Home
    assert has_content? body
  end

  test 'as a visitor, I can view About with a title' do
    title = Faker::Lorem.words(number: 3).join("\s")
    body = Faker::Lorem.words(number: 5).join("\s")

    create :about, title: title, body: body

    visit about_page_path

    assert_selector 'header h1', text: title
    assert_not has_link? :Create
    assert_not has_link? :Edit
    assert has_link? :Home
    assert has_content? body
  end

  test "as an administrator, I have the create link available if there isn't an About previously created" do
    new_session admin_user

    visit about_page_path

    assert has_link? :Create
    assert_not has_link? :Edit
  end

  test 'as an administrator, I have the Update link available if there is an About previously created' do
    create :about

    new_session admin_user

    visit about_page_path

    assert has_link? :Edit
    assert_not has_link? :Create
  end

  test 'as a visitor, I am unauthorized to create an About' do
    create :about

    new_session

    visit new_about_path

    assert_unauthorized_user
  end

  test 'as an administrator, I can create an About ' do
    new_session admin_user

    visit about_page_path

    click_link :Create

    text = Faker::Lorem.paragraph
    fill_in_rich_text_area 'about[body]', with: text

    click_button 'Create About'

    assert_success_alert
    assert has_content? text
  end

  test 'as an administrator, I should be told why an About failed to create' do
    new_session admin_user

    visit about_page_path

    click_link :Create

    click_button 'Create About'

    assert_error_alert
  end

  test 'as a visitor, I am unauthorized to update an existing About' do
    about = create :about

    new_session

    visit edit_about_path(about)

    assert_unauthorized_user
  end

  test 'as an administrator, I can update an existing About' do
    create :about

    new_session admin_user

    visit about_page_path

    click_link :Edit

    fill_in_rich_text_area 'about[body]', with: Faker::Lorem.paragraph

    click_button 'Update About'

    assert_success_alert
  end

  test 'as an administrator, I should be told why an About failed to update' do
    create :about

    new_session admin_user

    visit about_page_path

    click_link :Edit

    fill_in_rich_text_area 'about[body]', with: nil

    click_button 'Update About'

    assert_error_alert
  end
end
