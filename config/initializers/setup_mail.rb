ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "deep@grepruby.com",
  :password             => "deepgupta",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
