class Education < ApplicationRecord
  store_accessor :name, :en, :bn
  validates :en, presence: {message: "English Name must be present"}
  validates :bn, presence: {message: "Bengali Name must be present"}
end
