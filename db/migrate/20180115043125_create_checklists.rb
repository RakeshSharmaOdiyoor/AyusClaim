class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :checklist_name
      t.timestamps
    end
  end
end
