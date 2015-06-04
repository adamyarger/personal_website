class Video < ActiveRecord::Base
	belongs_to :user

	auto_html_for :content do
	    html_escape
	    image
	    youtube(:width => "100%", :autoplay => false)
	    soundcloud
	    link :target => "_blank", :rel => "nofollow"
	    simple_format
	end
end
