class Api::V1::EducationsController < Api::V1::BaseController
  def index
    @educations = Education.all
    render_success @educations
  end
end
