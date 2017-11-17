class Qualification < ApplicationRecord
  has_attached_file :certificate_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :certificate_image, content_type: /\Aimage\/.*\z/
  belongs_to :education
  belongs_to :applicant_user
end
