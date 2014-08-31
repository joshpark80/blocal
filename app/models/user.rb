class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins 
  has_attached_file :image, :styles => { :medium => "100x100#", :thumb => "50x50#" }
  do_not_validate_attachment_file_type :image

end