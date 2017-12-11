class Warehouse < ApplicationRecord
  belongs_to :state
  belongs_to :district
  belongs_to :applicant_user
  has_many :appointments, as: :appointable

  validates  :name, presence: true
  validates  :owner_name, presence: true
  validates  :state_id,  presence: true
  validates  :district_id, presence: true
  validates  :post_office,  presence: true
  validates  :police_station, presence: true
  validates  :pincode, presence: true
  validates  :postal_address, presence: true
  validates  :applicant_user_id,  presence: true
  validates  :status, presence: true
end
