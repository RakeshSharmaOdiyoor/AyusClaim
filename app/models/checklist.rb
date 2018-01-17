class Checklist < ActiveRecord::Base
	has_many :claim_checklists, :dependent => :destroy
 	has_many :claims, :through => :claim_checklists

 	def check_collected?
 		check_collected = self.claim_checklists
 		return true if check_collected
 	end
end
