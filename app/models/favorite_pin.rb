class FavoritePin < ActiveRecord::Base
	belongs_to :favorited, class_name: "User"
	belongs_to :favorite, class_name: "Pin"
end
