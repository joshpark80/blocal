class AddTitleToPins < ActiveRecord::Migration
  def change
    add_column :pins, :title, :string
    add_index :pins, :title
  end
end
