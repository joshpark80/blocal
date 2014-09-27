class AddAttachmentPhoto3ToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :photo3
    end
  end

  def self.down
    drop_attached_file :comments, :photo3
  end
end
