class AddfullNameToUsers < ActiveRecord::Migration
  def change
      add_column :users, :full_name, :string, null: false, default: ""
  end
end
