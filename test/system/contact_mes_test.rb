require 'application_system_test_case'

class ContactMesTest < ApplicationSystemTestCase
  test 'as a visitor, I can create a contact me' do
    visit new_contact_me_path

    fill_in :contact_me_name, with: Faker::Name.name
    fill_in :contact_me_email, with: Faker::Internet.email
    fill_in :contact_me_message, with: Faker::Lorem.paragraph

    click_button :Send

    assert_success_alert
  end

  test 'as a visitor, I receive errors when a contact me fails' do
    visit new_contact_me_path

    fill_in :contact_me_name, with: Faker::Name.name
    fill_in :contact_me_message, with: Faker::Lorem.paragraph

    click_button :Send

    assert_error_alert
  end
end
