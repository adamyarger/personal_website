module ApplicationHelper

	def markdown(text)
		Markdown.new(text).to_html.html_safe
	end

end
