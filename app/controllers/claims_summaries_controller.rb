class ClaimsSummariesController < ApplicationController
  
  layout 'ad'
  
  def index
  	@search = Claim.order('claims.created_at desc').search(params[:q])
  	@search.created_at_gteq = Date.today.beginning_of_day
	  @search.created_at_lteq = Date.today.end_of_day
  	@claims = @search.result(:distinct => true)
  	respond_to do |format|
      format.html { }
      format.pdf { }
      format.csv {
        send_data generate_csv, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=claims_summaries.csv" 
      }
    end
  end
  

  def by_day
    @date = params[:date].blank?? Date.today : params[:date].to_date
    @search = Claim.order('claims.created_at desc').search(params[:q])
    @search.status_eq = params[:status_eq] unless params[:status_eq].blank?
    @search.scheme_eq = params[:scheme_eq] unless params[:scheme_eq].blank?
    @search.ip_no_cont = params[:ip_no_cont] unless params[:ip_no_cont].blank?
    @search.uhid_no_cont = params[:uhid_no_cont] unless params[:uhid_no_cont].blank?
    @search.created_at_gteq =@date.beginning_of_day
    @search.created_at_lteq = @date.end_of_day
    @claims = @search.result(:distinct => true)
    respond_to do |format|
      format.html { }
      format.pdf { }
      format.js
      format.csv {
        send_data generate_csv, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=claims_summaries_by_day.csv" 
      }
    end
  end
  
  def date_range
    if(!params[:from_date].blank? || !params[:to_date].blank? )
      @date = params[:date].blank?? Date.today : params[:date].to_date
      @search = Claim.order('claims.created_at desc').search(params[:q])
      @search.status_eq = params[:status_eq] unless params[:status_eq].blank?
      @search.scheme_eq = params[:scheme_eq] unless params[:scheme_eq].blank?
      @search.ip_no_cont = params[:ip_no_cont] unless params[:ip_no_cont].blank?
      @search.uhid_no_cont = params[:uhid_no_cont] unless params[:uhid_no_cont].blank?
      @search.created_at_gteq = params[:from_date].to_date.beginning_of_day unless params[:from_date].blank?
      @search.created_at_lteq = params[:to_date].to_date.end_of_day unless params[:to_date].blank?
      @claims = @search.result(:distinct => true)
      respond_to do |format|
        format.html { }
        format.pdf { }
        format.js
        format.csv {
          send_data generate_csv, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=claims_summaries_by_date_range.csv" 
        }
      end
    end
  end
  
  def by_month  
    @date = Date.new(params[:date][:year].to_i,params[:date][:month].to_i, params[:date][:day].to_i)
    @search = Claim.order('claims.created_at desc').search(params[:q])
    @search.status_eq = params[:status_eq] unless params[:status_eq].blank?
    @search.scheme_eq = params[:scheme_eq] unless params[:scheme_eq].blank?
    @search.ip_no_cont = params[:ip_no_cont] unless params[:ip_no_cont].blank?
    @search.uhid_no_cont = params[:uhid_no_cont] unless params[:uhid_no_cont].blank?
    @search.created_at_gteq = @date.beginning_of_month.beginning_of_day
    @search.created_at_lteq = @date.end_of_month.end_of_day
    @claims = @search.result(:distinct => true)
    respond_to do |format|
      format.html { }
      format.pdf { }
      format.js
      format.csv {
        send_data generate_csv, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=claims_summaries_by_month.csv" 
      }
    end
  end

  private
    def generate_csv
      csv_string = CSV.generate do |csv|
        csv << ["Sl no.","Scheme","Patient name","IP no.", "UHID no.", "Reg no.", "DOA", "DOS", "DOD", "Plan of treatment", "Approved Amount","Claim Amount", "TDS","Net Amount","Hospital charges","Medicine charges","Implant charges"]
        sl_no = 1
        @claims.each do |claim|
          csv <<[sl_no,"#{claim.scheme rescue ""}","#{claim.patient_name rescue ""}","#{claim.ip_no rescue ""}","#{claim.uhid_no rescue ""}","#{claim.reg_no rescue ""}","#{claim.date_of_admission}","#{claim.date_of_surgery}","#{claim.date_of_discharge}","#{claim.plan_of_treatment rescue ""}",(claim.approved_amount rescue 0.0),(claim.claim_amount rescue 0.0),(claim.tds_amount rescue 0.0),(claim.net_amount rescue 0.0),(claim.hospital_charge rescue 0.0),(claim.medicine_charge rescue 0.0),(claim.implant_charge rescue 0.0)]
          sl_no +=1
        end
      end
      csv_string
    end

end
