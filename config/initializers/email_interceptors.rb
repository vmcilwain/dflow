if ENV['PIPE_ENV'] == 'staging'
  ActionMailer::Base.register_interceptor(StagingEmailInterceptor)
end