class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_by(id: session[:current_user_id])
  end
  helper_method :current_user

  def authorize_api
    unless current_user
      render json: { error: 'Not Authorized Access' }, status: 403
    end
  end
end
