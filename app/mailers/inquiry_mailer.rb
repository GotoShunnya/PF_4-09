class InquiryMailer < ApplicationMailer

  default from: 'from@example.com'

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: ENV["SITE_EMAIL"],
      to: ENV["MY_EMAIL"],
      subject: "お問い合わせ内容"
      )
  end
end
