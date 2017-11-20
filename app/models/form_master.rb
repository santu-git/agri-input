class FormMaster < ApplicationRecord
  before_save :generate_identifier

  private
  def generate_identifier
    self.identifier = self.name.parameterize.underscore    
  end
end
