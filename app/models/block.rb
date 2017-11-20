class Block < ApplicationRecord
  belongs_to :subdivision
  has_many :mouzas
end
