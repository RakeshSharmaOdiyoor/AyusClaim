require 'roo'
class Claim < ActiveRecord::Base
	has_many :claim_checklists, :dependent => :destroy
  	has_many :checklists, :through => :claim_checklists
  	#validates :utr_no, :presence => true

  	def aby?
  	  scheme == "aby"
  	end

  	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    claim = Claim.find_by_utr_no(row["UTR_NO"])
	    #unless claim.blank?
	    #	claim.status = row["CLAIM STATUS"]
	    #	claim.approved_amount = row["Paid AMT"]
	    #	claim.tds_amount = row["TDS"]
	    #	claim.net_amount = row["NET AMT PAID"]
	    #	claim.save!
	    #else
	    	claim = Claim.new()
	    	claim.district = row["MEMBERDISTRICT"]
	    	claim.urn_no = row["URN"]
	    	claim.patient_name = row["PATIENTNAME"]
	    	claim.age = row["PATIENTAGE"]
	    	claim.date_of_admission = row["DOA"]
	    	claim.date_of_discharge = row["DOD"]
	    	claim.procedure_code = row["PROCEDURENAME"]
	    	claim.utr_no = row["UTR_NO"]
	    	claim.status = 'paid' if row["CLAIM STATUS"] == "Paid"
	    	claim.status = 'approved' if row["CLAIM STATUS"] == "Approved"
	    	claim.status = 'denied' if row["CLAIM STATUS"] == "Denial"
	    	claim.status = 'pending' if row["CLAIM STATUS"] == "Pending"

	    	claim.claim_amount = row["AMOUTCLAIMED"]
	    	claim.approved_amount = row["Paid AMT"]
	    	claim.tds_amount = row["TDS"]
	    	claim.net_amount = row["NET AMT PAID"]
	    	claim.scheme = 'rsby' if (row["HEALTH INDIA CLAIM NUMBER"].split('/').first) == "RSBY"
	    	claim.scheme = 'yeshaswini' if (row["HEALTH INDIA CLAIM NUMBER"].split('/').first) == "Yeshaswini"
	    	claim.scheme = 'aby' if (row["HEALTH INDIA CLAIM NUMBER"].split('/').first) == "ABY"

	    	claim.card_no = row["HEALTH INDIA CLAIM NUMBER"].split('/').last if(row["HEALTH INDIA CLAIM NUMBER"].split('/').first == "Yeshaswini")
	    	claim.urn_no = row["HEALTH INDIA CLAIM NUMBER"].split('/').last if(row["HEALTH INDIA CLAIM NUMBER"].split('/').first == "RSBY")
	    	claim.reg_no = row["HEALTH INDIA CLAIM NUMBER"].split('/').last if(row["HEALTH INDIA CLAIM NUMBER"].split('/').first == "ABY")
	    	claim.save!
	    #end
	    #product = find_by_id(row["id"]) || new
	    #product.attributes = row.to_hash.slice(*accessible_attributes)
	    #product.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
	  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end
end
