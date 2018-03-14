class Trainee::TraineesController < ApplicationController
  def index
    @subjects = Subject.all
  end
end
