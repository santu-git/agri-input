class FormA1 < ApplicationRecord
  belongs_to :role
  belongs_to :place, polymorphic: true
  belongs_to :state
  belongs_to :district
  belongs_to :subdivision
  belongs_to :certification_type
  belongs_to :jurisdiction
  belongs_to :applicant_user
  has_many :appointments, as: :appointable

  has_and_belongs_to_many :warehouses

  before_create :generate_application_number
  after_create :assign_notifier

  def generate_application_number
    self.application_number = Time.now.to_i
  end

  def assign_notifier
    jurisdiction = self.jurisdiction.name["en"]
    x = Object.const_get(jurisdiction.capitalize).find(self.send("#{jurisdiction.parameterize}_id"))
    designation = x.designations.find_by_role_id(self.role_id)
    self.appointments.build({designation: designation, status: 'new'}).save!
    self.warehouses.each{|w| w.appointments.build(designation: designation, status: 'new').save!}
  end
  
end
