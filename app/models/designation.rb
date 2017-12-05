class Designation < ApplicationRecord
  belongs_to :state
  belongs_to :district
  belongs_to :block
  belongs_to :admin_user
  belongs_to :role

  has_many :appointments
end
