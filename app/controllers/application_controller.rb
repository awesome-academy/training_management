class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for resource
    if current_user.admin?
      admin_root_path
    elsif current_user.trainee?
      trainee_root_path
    else current_user.trainer?
      trainer_root_path
    end
  end
end
