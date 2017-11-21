class Applicant::BaseController < ApplicationController
    before_action :authenticate_applicant_user!
    layout "applicant"
  end
  