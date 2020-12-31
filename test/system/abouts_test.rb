require "application_system_test_case"

class AboutsTest < ApplicationSystemTestCase
  test "visiting about without a title" do
    body = Faker::Lorem.words(number: 5).join("\s")

    create :about, body: body
    
    visit about_path
    
    assert_not has_css? 'header h1'
    assert has_link? :Home
    assert has_content? body
  end

  test "visiting about with a title" do
    title = Faker::Lorem.words(number: 3).join("\s")
    body = Faker::Lorem.words(number: 5).join("\s")

    create :about, title: title, body: body
    
    visit about_path
    
    assert_selector 'header h1', text: title
    assert has_link? :Home
    assert has_content? body
  end
end
