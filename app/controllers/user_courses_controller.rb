class UserCoursesController < ApplicationController
  def create
    @usercourse = UserCourses.new usercourse_params
  end

  private

  def usercourse_params
    params.require(:usercourse).permit :course_id, :user_id
  end
end
