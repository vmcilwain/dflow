unless Rails.env.development? 
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'dflow.com',
    user_name: Rails.application.credentials.mailer_user,
    password: Rails.application.credentials.mailer_password,
    authentication: :login,
    enable_starttls_auto: true
  }
end