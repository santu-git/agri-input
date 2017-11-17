class AddAttachmentCertificateImageToQualifications < ActiveRecord::Migration[5.1]
  def self.up
    change_table :qualifications do |t|
      t.attachment :certificate_image
    end
  end

  def self.down
    remove_attachment :qualifications, :certificate_image
  end
end
