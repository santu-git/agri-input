class AddAttachmentIdCardImageToApplicantProfiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :applicant_profiles do |t|
      t.attachment :id_card_image
    end
  end

  def self.down
    remove_attachment :applicant_profiles, :id_card_image
  end
end
