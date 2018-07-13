class ToAddDepartmentToClaimTable < ActiveRecord::Migration
  def change
  	add_column :claims,:department,:string
  end
end
