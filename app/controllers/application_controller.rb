class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :custom_authentication

  def custom_authentication
    if current_admin_user
      authenticate_admin_user!
    else
      authenticate_applicant_user!
    end
  end
end
