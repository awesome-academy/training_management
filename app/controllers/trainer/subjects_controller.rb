class Trainer::SubjectsController < ApplicationController

  before_action :find_subject, only: [:show]

  def index
    @user_courses = current_user.courses
  end

  def show
    @subjects = Subject.only_id_name_field.paginate(page: params[:page], per_page: Settings.page.maximum)
    @tasks = @subject.tasks.only_id_name_field.paginate(page: params[:page], per_page: Settings.page.maximum)
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
