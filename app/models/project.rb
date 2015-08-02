class Project < ActiveRecord::Base
	validates :title, :description, :content, :presence => true
	default_scope -> {order(created_at: :desc)}
end
