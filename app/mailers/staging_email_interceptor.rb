class StagingEmailInterceptor
  def self.delivering_email(message)
    message.to = ['vmcilwain@me.com']
  end
end