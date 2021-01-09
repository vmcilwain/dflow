class StagingEmailInterceptor
  def self.delivering_email(message)
    message.to = ['vmcilwain@me.com']
    message.subject = "[Staging] " + message.subject
  end
end