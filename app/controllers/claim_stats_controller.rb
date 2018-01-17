class ClaimStatsController < ApplicationController
	layout 'ad'
	def by_month
	  	@date = Date.new(params[:date][:year].to_i,params[:date][:month].to_i, params[:date][:day].to_i)
	    @search = Claim.order('claims.created_at desc').search(params[:q])
	 
	  	@search.created_at_gteq = @date.beginning_of_month.beginning_of_day
	  	@search.created_at_lteq = @date.end_of_month.end_of_day
	  	@claims = @search.result(:distinct => true)     
	    respond_to do |format|
	      format.js 
	    end 
	end 
end
