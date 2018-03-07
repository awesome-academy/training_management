class Admin::UsersController < ApplicationController

  def index
    @trainees = User.by_role User.roles[:trainee]
    @trainers = User.by_role User.roles[:trainer]
    @admin = User.by_role User.roles[:admin]

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

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation, :role
  end
end
