class AddAttachmentPhotoToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :comments, :photo
  end
end
