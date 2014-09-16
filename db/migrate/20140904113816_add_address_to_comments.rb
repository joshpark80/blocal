class AddAddressToComments < ActiveRecord::Migration
  def change
    add_column :comments, :address, :string
  end
end
