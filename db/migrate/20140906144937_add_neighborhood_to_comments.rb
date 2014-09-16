class AddNeighborhoodToComments < ActiveRecord::Migration
  def change
    add_column :comments, :neighborhood, :string
  end
end
