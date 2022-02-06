class ApplicationController < ActionController::Base
  before_action :set_current_user

  def require_user_logged_in!
    redirect_to login_path, alert: "You must be signed in." if Current.user.nil?

  end

  def set_current_user
    if session[:user_id]
      Current.user = User.find(session[:user_id])
    end
  end

end
