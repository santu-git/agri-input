class ApplicantProfile < ApplicationRecord
  has_attached_file :id_card_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :id_card_image, content_type: /\Aimage\/.*\z/
  
  belongs_to :applicant_user
end
