class Admin::UserCoursesController < ApplicationController
  load_and_authorize_resource :course
  before_action :find_course

  def new
    @trainees = User.trainee.not_in_course @course.id
    @trainers = User.trainer.not_in_course @course.id
    @course_users = @course.users
  end

  def create
    if course_params["user_ids"]
      count = 0
      course_params["user_ids"].each do |user_id|
        count += 1 if UserCourse.create course_id: @course.id, user_id: user_id.to_i
      end

      flash[:success] = t(".success") if count == params[:course]["user_ids"].size
      redirect_to admin_course_url @course
    else
      flash[:error] = t ".error"
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit :course_id, user_ids: []
  end

  def find_course
    @course = Course.find_by id: params[:course_id]

    return if @course
    flash[:warning] = t ".not_found"
    redirect_to new_admin_course_path
  end
end
