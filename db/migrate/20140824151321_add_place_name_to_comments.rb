class AddPlaceNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :place_name, :string
  end
end
