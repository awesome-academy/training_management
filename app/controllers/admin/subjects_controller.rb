class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :find_subject, only: [:show, :edit, :destroy, :update]

  def index
    @subjects = Subject.only_id_name_field.paginate(page: params[:page], per_page: Settings.page.maximum)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params

    if @subject.save
      flash[:success] = t "admin.subjects.new.success_create"
      redirect_to admin_subject_path @subject
    else
      flash.now[:danger] = t "admin.subjects.new.success_fail"
      render :new
    end
  end

  def show
    @tasks = @subject.tasks.only_id_name_field.paginate(page: params[:page], per_page: Settings.page.maximum)
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "admin.subjects.new.subject_update"
      redirect_to admin_subject_path @subject
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "admin.subjects.new.subject_destroy"
    else
      flash[:warning] = t "admin.subjects.new.destroy_fail"
    end
    redirect_to admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit :subject_name, tasks_attributes: [:id, :task_name, :_destroy, :time_day, :start_date]
  end

  def find_subject
    @subject = Subject.find_by id: params[:id]

    return if @subject

    flash[:alert] = "Not found subject with id #{params[:id]}"
    redirect_to root_path
  end
end
