class AdminProfile < ApplicationRecord
  belongs_to :admin_user
  validates :name, presence: true
  validates :mobile_no, presence: true
  validates :gender, presence: true
  validates :prefer_language, presence: true
  #validates :role_id, presence: true
end
