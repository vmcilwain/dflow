namespace :install do
  desc "Install mailcatcher gem"
  task :mailcatcher do
    system "gem install mailcatcher -- --with-cflags=\"-Wno-error=implicit-function-declaration\""
    
    puts "Don't forget to add the following to the development environment"
    puts "config.action_mailer.delivery_method = :smtp"
    puts "config.action_mailer.smtp_settings = { :address => '127.0.0.1', :port => 1025 }"
  end
end