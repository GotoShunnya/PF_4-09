class InquiriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @inquiry = Inquiry.new
  end

  def back
    @inquiry = Inquiry.new(inquiry_params)
    render :new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :confirm
    else
      render :new
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    if InquiryMailer.send_mail(@inquiry).deliver
      flash.now[:notice] = "送信完了いたしました。"
      render :thanks
    else
      flash.now[:alert] = "送信に失敗しました。"
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
