class CoursesController < ApplicationController
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
      redirect_to root_url
    else
      redirect_to course_new_path
    end
  end

  def update
  end

  def show
    @course = Course.find_by id: params[:id]
  end

  def destroy
  	
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :start_date, :end_date,
                                   course_subjects_attributes: [:id, :subject_id, :_destroy])
  end
end
