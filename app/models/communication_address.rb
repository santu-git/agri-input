class CommunicationAddress < ApplicationRecord
  belongs_to :applicant_user
  belongs_to :state
  belongs_to :district
end
