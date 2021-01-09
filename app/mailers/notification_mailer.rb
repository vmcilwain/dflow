class NotificationMailer < ApplicationMailer
  def contact_me_email
    @contact_me = params[:contact_me]
    mail(to: Rails.application.credentials.contact_me_to, subject: @contact_me.name + " would like to contact you")
  end
end
