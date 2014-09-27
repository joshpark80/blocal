class Comment < ActiveRecord::Base
  belongs_to :pin

  has_attached_file :image, :styles => { :crop => '100x100#', :medium => "300x300>", :med => "500x500>", :large => "1000x1000>" }
  do_not_validate_attachment_file_type :image

  has_attached_file :photo, :styles => { :crop => '100x100#', :medium => "300x300>", :med => "500x500>", :large => "1000x1000>" }
  do_not_validate_attachment_file_type :photo

  has_attached_file :photo2, :styles => { :crop => '100x100#', :medium => "300x300>", :med => "500x500>", :large => "1000x1000>" }
  do_not_validate_attachment_file_type :photo

  has_attached_file :photo3, :styles => { :crop => '100x100#', :medium => "300x300>", :med => "500x500>", :large => "1000x1000>" }
  do_not_validate_attachment_file_type :photo

  has_attached_file :photo4, :styles => { :crop => '100x100#', :medium => "300x300>", :med => "500x500>", :large => "1000x1000>" }
  do_not_validate_attachment_file_type :photo

  has_many :collect_comments, foreign_key: "collect_id"                                
  has_many :collected_by, through: :collect_comments, source: :collected

end
