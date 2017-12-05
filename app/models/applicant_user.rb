class ApplicantUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :applicant_profile#, class_name: 'ApplicantProfile', foreign_key: 'applicant_user_id'
  has_one :communication_address
  has_many :warehouses
  has_many :qualifications
  has_many :form_a1s
  accepts_nested_attributes_for :applicant_profile, allow_destroy: true
  accepts_nested_attributes_for :communication_address, allow_destroy: true


  def postal_address
    "#{communication_address.street_no}, P.O - #{communication_address.post_office}, P.S -  #{communication_address.police_station}, PIN - #{communication_address.pin_code}, Mobile No - #{applicant_profile.mobile_no}"
  end
end
