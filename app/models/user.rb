class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins 
  has_attached_file :image, :styles => { :medium => "100x100#", :thumb => "50x50#" }, 
  :default_url => "https://s3.amazonaws.com/b_local/users/images/default/:style/default_avatar.jpg"
  do_not_validate_attachment_file_type :image

  has_many :favorite_pins, foreign_key:"favorited_id"  
  has_many :favorites, through: :favorite_pins, source: :favorite
  has_many :collect_comments, foreign_key:"collected_id"  
  has_many :collects, through: :collect_comments, source: :collect


end