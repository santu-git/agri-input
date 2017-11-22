class Qualification < ApplicationRecord
  has_attached_file :certificate_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :certificate_image, content_type: /\Aimage\/.*\z/
  belongs_to :education
  belongs_to :applicant_user
  validates  :resource_type, presence: true
  validates  :resource_name, presence: true
  validates  :education_id,  presence: true
  validates  :passing_institute, presence: true
  validates  :passing_year,  presence: true
  validates  :certificate_number, presence: true
  validates  :status, presence: true
  validates  :applicant_user_id, presence: true
  validates  :certificate_image_file_name, presence: true
  validates  :certificate_image_content_type, presence: true
  validates  :certificate_image_file_size, presence: true
 
end
