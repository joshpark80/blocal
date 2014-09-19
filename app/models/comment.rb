class Comment < ActiveRecord::Base
  belongs_to :pin

  has_attached_file :image, :styles => { :crop => '100x100#', :medium => "300x300>", :large => "1000x1000>" }
  do_not_validate_attachment_file_type :image

  has_many :collect_comments, foreign_key: "collect_id"                                
  has_many :collected_by, through: :collect_comments, source: :collected

end
