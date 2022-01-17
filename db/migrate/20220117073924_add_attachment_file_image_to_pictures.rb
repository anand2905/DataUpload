class AddAttachmentFileImageToPictures < ActiveRecord::Migration[5.2]
  def self.up
    change_table :pictures do |t|
      t.attachment :file_image
    end
  end

  def self.down
    remove_attachment :pictures, :file_image
  end
end
