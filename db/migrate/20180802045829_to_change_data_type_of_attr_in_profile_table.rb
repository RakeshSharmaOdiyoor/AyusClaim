class ToChangeDataTypeOfAttrInProfileTable < ActiveRecord::Migration
  def change
  	change_column :profiles, :address, :text
  	change_column :profiles, :other_information, :text
  end
end
