class CertificateRule < ApplicationRecord
  belongs_to :jurisdiction
  belongs_to :certification_type
  belongs_to :role

  before_save :calculate_days

  private
  def calculate_days
    self.validity_days = self.validity * 365 if self.validity_unit == 'y'
    self.validity_days = self.validity * 30 if self.validity_unit == 'm'
    self.validity_days = self.validity
  end
end
