class ToAddHospitalMedicinImplantChargesToClaims < ActiveRecord::Migration
  def change
  	add_column :claims,:hospital_charge,:decimal,precision: 10, scale: 2, default: 0.0
  	add_column :claims,:medicine_charge,:decimal,precision: 10, scale: 2, default: 0.0
  	add_column :claims,:implant_charge,:decimal,precision: 10, scale: 2, default: 0.0
  end
end
