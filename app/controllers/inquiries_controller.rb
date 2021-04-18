class InquiriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :action => "confirm"
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.send_mail(@inquiry).deliver
      render :action => "thanks"
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
    end
end
