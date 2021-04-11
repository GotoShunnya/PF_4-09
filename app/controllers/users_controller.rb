class UsersController < ApplicationController
  def top
  end

  def about
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def leave
  end

  def withdraw
  end
end
