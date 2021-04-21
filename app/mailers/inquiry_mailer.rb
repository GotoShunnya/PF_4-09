class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: "from@example.com",
      to: "1800syunya@gmail.com",
      subject: "お問い合わせ内容"
      )
  end
end
