class Admins::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def leave
  end

  def update
  end
end
