class Subdivision < ApplicationRecord
  belongs_to :district
  has_many :blocks
end
