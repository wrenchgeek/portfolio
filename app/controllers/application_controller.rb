class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # rescue_from Pundit::NotDefinedError, with: :not_logged_in

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to do that."
    redirect_to(request.referrer || root_path)
  end

  def not_logged_in
    flash[:alert] = "You are not logged in"
    redirect_to new_user_session_path
  end
end
