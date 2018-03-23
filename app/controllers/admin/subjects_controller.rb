class Admin::SubjectsController < ApplicationController
  before_action :find_subject, only: [:update, :show]

  def index
    @subjects = Subject.all.order(:subject_name).paginate(page: params[:page], per_page: Settings.page.maximum)
  end

  def new
    @subject = Subject.new
    @task = Task.new
  end

  def create
    @subjects = Subject.new subject_params

    if @subjects.save
      flash[:success] = t "admin.subjects.new.success"
      redirect_to admin_subjects_path
    else
      redirect_to new_admin_subject_path
    end
  end

  def edit
    
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def subject_params
    params.require(:subject).permit :subject_name, task_attributes: [:id, :_destroy]
  end

  def find_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    flash[:success] = t "devise.omniauth_callbacks.success"
    redirect_to root_path
  end
end
