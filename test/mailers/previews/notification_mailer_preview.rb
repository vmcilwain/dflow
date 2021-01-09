# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def contact_me_email
    NotificationMailer.with(contact_me: ContactMe.last).contact_me_email
  end
  
end
