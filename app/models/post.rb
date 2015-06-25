class Post < ActiveRecord::Base

	validates :title, :description, :content, :presence => true
	belongs_to :user
	acts_as_taggable
	# acts_as_taggable_on :skills, :interests

	default_scope -> {order(created_at: :desc)}

end
