class CollectComment < ActiveRecord::Base
	belongs_to :collected, class_name: "User"
	belongs_to :collect, class_name: "Comment"
end
