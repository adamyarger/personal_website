module ApplicationHelper

	def markdown(text)
		options = [:hard_wrap, :filter_html, :autolink, :no_intraemphisis, :fenced_code, :gh_blockcode]
		syntax_highlighter(Markdown.new(text, *options).to_html).html_safe
	end

	def syntax_highlighter(html)
	  doc = Nokogiri::HTML(html)
	  doc.search("//pre[@lang]").each do |pre|
	    pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
	  end
	  doc.to_s
	end

end
