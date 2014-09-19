class CreateCollectComments < ActiveRecord::Migration
  def change
    create_table :collect_comments do |t|
      t.integer :collect_id
      t.integer :collected_id

      t.timestamps
    end
    add_index :collect_comments, :collect_id    
    add_index :collect_comments, :collected_id    
    add_index :collect_comments, [:collect_id, :collected_id], unique: true
  end
end
