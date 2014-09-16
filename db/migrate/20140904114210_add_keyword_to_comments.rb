class AddKeywordToComments < ActiveRecord::Migration
  def change
    add_column :comments, :keyword, :string
  end
end
