class AddHtmLtoArticles < ActiveRecord::Migration
  def change
      add_column :articles, :html, :string
  end
end
