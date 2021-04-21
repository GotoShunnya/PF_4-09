class ApplicationMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
  layout 'mailer'
end
