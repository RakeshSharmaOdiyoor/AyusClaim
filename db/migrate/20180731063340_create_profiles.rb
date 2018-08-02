class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :address
      t.string :mobile
      t.string :other_information

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
