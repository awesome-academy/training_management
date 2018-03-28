class Trainer::UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit]

  def index
    @users = User.all.order(:role).paginate page: params[:page], per_page: Settings.page.maximum
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".update_success", object_name: User.name
      redirect_to trainer_user_path
    else
      render :edit
    end
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".danger"
    redirect_to trainer_root_path
  end

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation
  end
end
