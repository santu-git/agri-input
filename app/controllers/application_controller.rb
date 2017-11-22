class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :custom_authentication, :set_language
  before_action :set_language

  def custom_authentication
    if current_admin_user
      authenticate_admin_user!
    else
      authenticate_applicant_user!
    end
  end

  def set_language
    @language =  'en' 
    @language = current_applicant_user.applicant_profile.prefer_language || 'en' if current_applicant_user
  end
end
