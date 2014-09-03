class Pin < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_attached_file :image, :styles => { :croppable => '240x240#', :medium => "300x300>", :thumb => "100x100>" }
	do_not_validate_attachment_file_type :image
    has_many :favorite_pins, foreign_key: "favorite_id"                                
    has_many :favorited_by, through: :favorite_pins, source: :favorited

end
