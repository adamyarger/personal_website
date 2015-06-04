class Video < ActiveRecord::Base
	belongs_to :user

	auto_html_for :body do
	    html_escape
	    image
	    youtube(:width => 400, :height => 250, :autoplay => false)
	    soundcloud
	    link :target => "_blank", :rel => "nofollow"
	    simple_format
	end
end
