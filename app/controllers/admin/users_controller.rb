class Admin::UsersController < ApplicationController
  before_action :ensure_admin

  def index

  end

  def new
   @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to admin_root_path
      flash[:success] = t ".success"

    else
      render :new
    end
  end

  private

  def ensure_admin
    unless current_user.admin?
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation, :role
  end
end
