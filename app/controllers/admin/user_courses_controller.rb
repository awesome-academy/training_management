class Admin::UserCoursesController < ApplicationController
  load_and_authorize_resource :course
  before_action :find_course

  def edit
    @trainees = User.trainee.not_in_course @course.id
    @trainers = User.trainer.not_in_course @course.id
    @course_users = @course.users
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t ".success"
      redirect_to admin_course_url @course
    else
      flash[:error] = t ".error"
      render :edit
    end
  end

  private

  def course_params
    params[:course] = {user_ids: []} if params[:course].nil?
    params.require(:course).permit user_ids: []
  end

  def find_course
    @course = Course.find_by params[:id]
    return if @course
      flash[:warning] = t ".not_found"
      redirect_to new_admin_course_path
  end
end
