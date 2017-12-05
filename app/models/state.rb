class State < ApplicationRecord
  has_many :districts
  has_many :form_a1, as: :place

  has_many :designations
end
