class AddMapToComments < ActiveRecord::Migration
  def change
    add_column :comments, :map, :text
  end
end
