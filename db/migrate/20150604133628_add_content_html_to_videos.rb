class AddContentHtmlToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :content_html, :text
  end
end
