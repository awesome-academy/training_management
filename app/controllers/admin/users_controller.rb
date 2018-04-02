class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  before_action :find_user, only: [:destroy, :show, :update]

  def index
    @users = User.all.order(:role).paginate page: params[:page], per_page: Settings.page.maximum
    if params[:email]
      @users = User.search_email(params[:email]).paginate page: params[:page], per_page: Settings.page.maximum
    else
      @users = User.all.paginate page: params[:page], per_page: Settings.page.maximum
    end
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
      flash[:success] = t ".create_success"
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    redirect_to admin_root_path
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".update_success", object_name: User.name
      redirect_to admin_users_url
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".danger"
    redirect_to admin_root_path
  end

  def user_params
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
    params.require(:user).permit :email, :password, :password_confirmation, :role
  end
end
