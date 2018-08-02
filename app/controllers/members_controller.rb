class MembersController < ApplicationController
  layout 'ad'
  
  def index
    @users = User.includes([:profile]).order("users.created_at ASC")
  end

  def new
    @user = User.new
    @user.build_profile
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to members_path
    else
      @user.build_profile
      render :new
    end
  end


  def edit 
  	@user = User.find(params[:id])
    @user.build_profile if @user.profile.blank?
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(update_user_params)
        format.html { redirect_to members_path, notice: 'Claim was successfully updated.' }
        format.json { head :no_content }
      else
        @user.build_profile if @user.profile.blank?
        format.html { render action: 'edit' }

      end
    end
  end

  def update_user_params
    params_attributes = params.require(:user).permit(:name,:user_type,:username ,:email, :password, :password_confirmation,:active, profile_attributes: [:id, :address, :mobile,  :other_information])
    if params_attributes[:password].blank?
      params_attributes.delete("password")
      params_attributes.delete("password_confirmation")
    end
  end

  private

  def user_params
  	params_attributes = params.require(:user).permit(:name,:user_type,:username ,:email, :password, :password_confirmation,:active, profile_attributes: [:id, :address, :mobile,  :other_information])
  end

end