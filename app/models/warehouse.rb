class Warehouse < ApplicationRecord
  belongs_to :state
  belongs_to :district
  belongs_to :applicant_user
end
