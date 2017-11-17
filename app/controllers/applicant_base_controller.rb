class ApplicantBaseController < ApplicationController
  layout "applicant"
  before_action :authenticate_applicant_user!
end
