class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :admin_profile#, class_name: 'ApplicantProfile', foreign_key: 'applicant_user_id'
  accepts_nested_attributes_for :admin_profile, allow_destroy: true
  has_many :designations
  accepts_nested_attributes_for :designations, allow_destroy: true
end
