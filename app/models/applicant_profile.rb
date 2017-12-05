class ApplicantProfile < ApplicationRecord
  has_attached_file :id_card_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :id_card_image, content_type: /\Aimage\/.*\z/
  
  belongs_to :applicant_user

  validates  :name, presence: true
  validates  :mobile_no, presence: true
  validates  :gender,  presence: true
  validates  :prefer_language, presence: true
  validates  :id_card_type,  presence: true
  validates  :id_card_number, presence: true
  validates  :dob, presence: true
  validates  :id_card_image_file_name, presence: true
  validates  :id_card_image_content_type,  presence: true
  validates  :id_card_image_file_size, presence: true
  
end
