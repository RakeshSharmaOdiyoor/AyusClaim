class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.string :patient_name
      t.string :scheme
      t.string :village
      t.string :taluk
      t.string :district
      t.string :age
      t.string :gender
      t.string :mobile_no
      t.string :hospital_name
      t.string :uhid_no
      t.string :inward_no
      t.string :ip_no
      t.string :surgery_name
      t.date :date_of_admission
      t.date :date_of_surgery
      t.date :date_of_discharge
      t.string :procedure_code
      t.string :card_no
      t.string :urn_no
      t.string :reg_no
      t.string :status
      t.decimal :claim_amount,precision: 10, scale: 2, default: 0.0
      t.decimal :approved_amount,precision: 10, scale: 2, default: 0.0
      t.decimal :penalty_amount,precision: 10, scale: 2, default: 0.0
      t.decimal :final_amount,precision: 10, scale: 2, default: 0.0
      t.decimal :tds_amount,precision: 10, scale: 2, default: 0.0
      t.decimal :net_amount,precision: 10, scale: 2, default: 0.0
      t.string :reason_for_rejection
      t.string :utr_no
      t.string :aadhar_no

      t.timestamps
    end
  end
end
