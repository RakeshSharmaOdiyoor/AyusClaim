class ClaimChecklist < ActiveRecord::Base
	belongs_to :claim
  	belongs_to :checklist	
end
