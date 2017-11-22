class CertificateRule < ApplicationRecord
  belongs_to :jurisdiction
  belongs_to :certification_type
  belongs_to :role

  before_save :calculate_days
  validates :new_application, presence: true
  validates :certificate_form, presence: true
  validates :renew_application, presence: true
  validates :validity, presence: true
  validates :validity_unit, presence: true
  private
  def calculate_days
    self.validity_days = self.validity * 365 if self.validity_unit == 'y'
    self.validity_days = self.validity * 30 if self.validity_unit == 'm'
    self.validity_days = self.validity
  end
end
