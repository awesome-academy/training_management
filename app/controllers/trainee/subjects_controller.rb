class Trainee::SubjectsController < ApplicationController

  def index
    @user_courses = current_user.courses
  end

  def show
    @subjects = Subject.only_id_name_field.paginate(page: params[:page], per_page: Settings.page.maximum)
  end

end
