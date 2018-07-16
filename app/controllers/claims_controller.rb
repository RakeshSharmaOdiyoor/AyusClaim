class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update, :destroy]
  require 'csv'
  layout 'ad'
  # GET /claims
  # GET /claims.json
  def index
    @search = Claim.order('claims.created_at desc').search(params[:q])
    @claims = @search.result(:distinct => true).paginate(:per_page => 50, :page => params[:page])
    respond_to do |format|
      format.html{}
      format.csv {
        send_data generate_csv, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=claims_list.csv" 
      }
    end
  end

  # GET /claims/1
  # GET /claims/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf {
        render pdf: 'show',
        layout: 'pdf_report.html',
        page_size: (params[:visit_report_print_size] == 'A5' ? 'A5' : 'A4' rescue 'A4'),
        zoom: RUBY_PLATFORM =~ /win32/ ? 1.3 : 1,
        disable_smart_shrinking: RUBY_PLATFORM =~ /win32/ ? true : false,
        print_media_type: true,
        dpi: 300,
        no_background: false,   
        encoding: 'utf8',
        image: true,
        margin: { top: (params[:visit_report_print_size] == 'A4' ? (@print_setting.visit_report_margin_top.to_i rescue "") : (@print_setting.a_five_visit_report_margin_top.to_i rescue "") ),
        bottom: (params[:visit_report_print_size] == 'A4' ? (@print_setting.visit_report_margin_bottom.to_i rescue "") : (@print_setting.a_five_visit_report_margin_bottom.to_i rescue "")),
        left: (params[:visit_report_print_size] == 'A4' ? (@print_setting.visit_report_margin_left rescue "") : (@print_setting.a_five_visit_report_margin_left rescue "")),
        right: (params[:visit_report_print_size] == 'A4' ? (@print_setting.visit_report_margin_right rescue "") : (@print_setting.a_five_visit_report_margin_right rescue "" ) )},
        show_as_html: params[:debug].present?
        }
    end

  end

  # GET /claims/new
  def new
    @claim = Claim.new
  end

  # GET /claims/1/edit
  def edit
    @claim = Claim.find(params[:id])
  end

  # POST /claims
  # POST /claims.json
  def create
    @claim = Claim.new(claim_params)

    respond_to do |format|
      if @claim.save
        format.html { redirect_to @claim, notice: 'Claim was successfully created.' }
        format.json { render action: 'show', status: :created, location: @claim }
      else
        format.html { render action: 'new' }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims/1
  # PATCH/PUT /claims/1.json
  def update
    respond_to do |format|
      if @claim.update(claim_params)
        format.html { redirect_to @claim, notice: 'Claim was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def checklist_claim
    unless params[:checklist_ids].blank?
      params[:checklist_ids].each do |id|
        ClaimChecklist.find_or_create_by(checklist_id: id, claim_id: params[:id], collected: true)
      end
    end
    redirect_to claims_path
  end

  def import
    Claim.import(params[:file])
    redirect_to claims_path, notice: "Claims imported."
  end

  # DELETE /claims/1
  # DELETE /claims/1.json
  def destroy
    @claim.destroy
    respond_to do |format|
      format.html { redirect_to claims_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def generate_csv
      csv_string = CSV.generate do |csv|
        csv << ["Sl no.","Scheme","IP no.", "Patient name", "UHID no.", "Reg no.", "DOA", "DOS", "DOD", "Plan of treatment", "Approved Amount","Claim Amount", "TDS","Net Amount","Hospital charges","Medicine charges","Implant charges"]
        sl_no = 1
        @claims.each do |claim|
          csv <<[sl_no,"#{claim.scheme rescue ""}","#{claim.ip_no rescue ""}","#{claim.patient_name rescue ""}","#{claim.uhid_no rescue ""}","#{claim.reg_no rescue ""}","#{claim.date_of_admission}","#{claim.date_of_surgery}","#{claim.date_of_discharge}","#{claim.plan_of_treatment rescue ""}",(claim.approved_amount rescue 0.0),(claim.claim_amount rescue 0.0),(claim.tds_amount rescue 0.0),(claim.net_amount rescue 0.0),(claim.hospital_charge rescue 0.0),(claim.medicine_charge rescue 0.0),(claim.implant_charge rescue 0.0)]
          sl_no +=1
        end
      end
      csv_string
    end


    def set_claim
      @claim = Claim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_params
      params.require(:claim).permit(:department,:hospital_charge,:medicine_charge,:implant_charge,:plan_of_treatment,:relationship,:designation,:kgid_no,:patient_name,:scheme,:village,:taluk,:district,:age,:gender,:mobile_no,:hospital_name,:uhid_no,:inward_no,:ip_no,:surgery_name,:date_of_admission,:date_of_surgery,:date_of_discharge,:procedure_code,:card_no,:urn_no,:reg_no,:status,:claim_amount,:approved_amount,:penalty_amount,:final_amount,:tds_amount,:net_amount,:reason_for_rejection,:utr_no,:aadhar_no)
    end
end
