class ApplicantUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :applicant_profile
  accepts_nested_attributes_for :applicant_profile
  has_many :warehouses
end
