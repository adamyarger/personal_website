class Post < ActiveRecord::Base

	validates :title, :description, :content, :presence => true
	belongs_to :user

	default_scope -> {order(created_at: :desc)}

	auto_html_for :body do
	    html_escape
	    image
	    youtube(:width => 400, :height => 250, :autoplay => false)
	    soundcloud
	    link :target => "_blank", :rel => "nofollow"
	    simple_format
	end

end
