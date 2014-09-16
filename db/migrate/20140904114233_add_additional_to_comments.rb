class AddAdditionalToComments < ActiveRecord::Migration
  def change
    add_column :comments, :additional, :string
  end
end
