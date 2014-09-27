class AddAttachmentPhoto2ToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :photo2
    end
  end

  def self.down
    drop_attached_file :comments, :photo2
  end
end
