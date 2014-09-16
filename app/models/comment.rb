class Comment < ActiveRecord::Base
  belongs_to :pin

  has_attached_file :image, :styles => { :crop => '100x100#', :medium => "300x300>", :large => "1000x1000>" }
  do_not_validate_attachment_file_type :image
end
