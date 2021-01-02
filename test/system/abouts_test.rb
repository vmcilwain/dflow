require "application_system_test_case"

class AboutsTest < ApplicationSystemTestCase
  test "as a visitor, I can  view about without a titler" do
    body = Faker::Lorem.words(number: 5).join("\s")

    create :about, body: body
    
    visit about_path
    
    assert_not has_css? 'header h1'
    assert_not has_link? :Create
    assert_not has_link? :Edit
    assert has_link? :Home
    assert has_content? body
  end

  test "as a visitor, I can view about with a title" do
    title = Faker::Lorem.words(number: 3).join("\s")
    body = Faker::Lorem.words(number: 5).join("\s")

    create :about, title: title, body: body
    
    visit about_path
    
    assert_selector 'header h1', text: title
    assert_not has_link? :Create
    assert_not has_link? :Edit
    assert has_link? :Home
    assert has_content? body
  end

  test "as an administrator, I have the create link available if there isn't an about previously created" do
    new_session admin_user

    visit about_path

    assert has_link? :Create
    assert_not has_link? :Edit
  end

  test "as an administrator, I have the Update link available if there is an about previously created" do
    create :about

    new_session admin_user

    visit about_path

    assert has_link? :Edit
    assert_not has_link? :Create
  end

  test "creating an about " do
    visit about_path
  end
end