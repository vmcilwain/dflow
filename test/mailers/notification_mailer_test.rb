require "test_helper"

class NotificationMailerTest < ActionMailer::TestCase
  test "contact me email" do
    message = Faker::Lorem.paragraph
    contact_me = create :contact_me, message: message

    email = NotificationMailer.with(contact_me: contact_me).contact_me_email
    
    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ["from@example.com"], email.from
    assert_equal [Rails.application.credentials.contact_me_to], email.to
    assert_equal contact_me.name + " would like to contact you", email.subject

    assert email.text_part.body.to_s.include?("Message from #{contact_me.name}(#{contact_me.email})")
    assert email.text_part.body.to_s.include?(message)
    
    assert email.html_part.body.to_s.include?("Message from #{contact_me.name}(#{contact_me.email})")
    assert email.html_part.body.to_s.include?(message)
  end
end
