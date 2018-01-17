class CreateClaimChecklists < ActiveRecord::Migration
  def change
    create_table :claim_checklists do |t|
      t.integer :claim_id
      t.integer :checklist_id
      t.boolean :collected
      t.timestamps
    end
  end
end
