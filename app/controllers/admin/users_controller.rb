class Admin::UsersController < ApplicationController
  before_action :find_user, only: [:destroy]

  def index
    @users = User.all.order(:role).paginate page: params[:page], per_page: Settings.page.maximum
    @trainees = User.trainee.all
  end

  def show

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

  def destroy
    if @user.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    redirect_to admin_root_path
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".danger"
    redirect_to admin_root_path
  end

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation, :role
  end
end
