class CreateFavoritePins < ActiveRecord::Migration
  def change
    create_table :favorite_pins do |t|
      t.integer :favorite_id
      t.integer :favorited_id

      t.timestamps
    end
    add_index :favorite_pins, :favorite_id    
    add_index :favorite_pins, :favorited_id    
    add_index :favorite_pins, [:favorite_id, :favorited_id], unique: true
  end
end
