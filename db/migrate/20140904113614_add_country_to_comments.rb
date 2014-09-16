class AddCountryToComments < ActiveRecord::Migration
  def change
    add_column :comments, :country, :string
  end
end
