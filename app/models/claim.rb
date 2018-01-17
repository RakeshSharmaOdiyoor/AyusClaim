require 'roo'
class Claim < ActiveRecord::Base
	has_many :claim_checklists, :dependent => :destroy
  	has_many :checklists, :through => :claim_checklists
  	validates :utr_no, :presence => true

  	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    claim = Claim.find_by_utr_no(row["UTR_NO"])
	    unless claim.blank?
	    	claim.status = row["CLAIM STATUS"]
	    	claim.approved_amount = row["Paid AMT"]
	    	claim.tds_amount = row["TDS"]
	    	claim.net_amount = row["NET AMT PAID"]
	    	claim.save!
	    end
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
