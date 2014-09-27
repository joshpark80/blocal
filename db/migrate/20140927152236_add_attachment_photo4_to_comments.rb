class AddAttachmentPhoto4ToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :photo4
    end
  end

  def self.down
    drop_attached_file :comments, :photo4
  end
end
