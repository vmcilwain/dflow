ActionMailer::Base.register_interceptor(StagingEmailInterceptor) if ENV['PIPE_ENV'] == 'staging'
