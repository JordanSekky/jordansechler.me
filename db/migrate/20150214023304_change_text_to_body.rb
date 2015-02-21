class ChangeTextToBody < ActiveRecord::Migration
  def change
    add_column :articles, :email, :string
    add_column :articles, :author, :string
    rename_column :articles, :text, :body
  end
end
