class ToaddColumsToClaimsTable < ActiveRecord::Migration
  def change
  	add_column :claims,:plan_of_treatment,:string
  	add_column :claims,:relationship,:string
  	add_column :claims,:designation,:string
  	add_column :claims,:kgid_no,:string
  end
end
