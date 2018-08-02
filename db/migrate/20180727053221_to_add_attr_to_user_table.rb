class ToAddAttrToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :user_type, :string
  	add_column :users, :active, :boolean, :default => true
  end
end
