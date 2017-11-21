class CommunicationAddress < ApplicationRecord
  belongs_to :applicant_user
  belongs_to :state
  belongs_to :district

  validates :street_no, presence: true
  validates :post_office, presence: true
  validates :police_station, presence: true
  validates :pin_code, presence: true
  validates :extended_type, presence: true
end
