class FormA1 < ApplicationRecord
  belongs_to :role
  belongs_to :place, polymorphic: true
  belongs_to :state
  belongs_to :district
  belongs_to :subdivision
  belongs_to :certificate_type
  belongs_to :jurisdiction
  belongs_to :applicant_user
end
