class Appointment < ApplicationRecord
  belongs_to :designation
  belongs_to :appointable, polymorphic: true

  scope :form_a1s, -> { where(appointable_type: "FormA1") }
  scope :warehouses, -> { where(appointable_type: "Warehouse") }
end
