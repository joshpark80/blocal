class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :pin, index: true

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end  

end
