class ApplicantUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :applicant_profile#, class_name: 'ApplicantProfile', foreign_key: 'applicant_user_id'
  has_many :warehouses

  accepts_nested_attributes_for :applicant_profile, allow_destroy: true
end
