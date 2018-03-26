class Admin::CoursesController < ApplicationController
  before_action :find_course, only: [:show, :update, :edit, :destroy]
  before_action :load_trainers, :load_trainees, only: [:show, :update]

  def index
    @courses = Course.all.order(:course_name).paginate(page: params[:page], per_page: Settings.page.maximum)
  end

  def new
    @course = Course.new
    Subject.all.each do |subject|
      @course.course_subjects.new subject: subject
    end
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = (t ".success")
      redirect_to admin_course_url @course
    else
      render :new
    end
  end

  def show
  end

  def edit
    Subject.all.each do |subject|
      @course.course_subjects.new(subject: subject) unless @course.subjects.include? subject
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = (t ".success_update")
      redirect_to admin_course_url
    else
      flash[:warning] = (t ".fail_update")
      redirect_to edit_admin_course_path
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = (t ".success_delete")
    else
      flash[:success] = (t ".fail_delete")
    end
    redirect_to admin_course_path
  end

  private

  def find_course
    @course = Course.find_by id: params[:id]
    return if @course
      flash[:warning] = t ".not_found"
      redirect_to new_admin_course_path
  end

  def course_params
    params.require(:course).permit :course_name, :start_date, :end_date,
                                   course_subjects_attributes: [:id, :subject_id, :_destroy],
                                   user_courses_attributes: [:id, :user_id, :_destroy]
  end

  def load_trainees
    @trainees = @course.users.trainee
  end

  def load_trainers
    @trainers = @course.users.trainer
  end
end
