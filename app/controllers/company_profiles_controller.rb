class CompanyProfilesController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Company_profiles", :company_profiles_path
  def new
    add_breadcrumb "New", :new_company_profile_path
    @company_profiles = CompanyProfile.new
  end

  def create
    @company_profiles = CompanyProfile.new(company_profile_param)
    @company_profiles.logo_url = params[:file]
    if @company_profiles.save
      @log = Log.create(description: "Added new companyprofile"+" "+@company_profiles.name, user: current_user)
      redirect_to @company_profiles
    else
      render 'new'
    end
  end

  def show
    @company_profiles = CompanyProfile.find(params[:id])
  end

  def index
    @company_profiles = CompanyProfile.all

  end


  def edit
    @company_profiles = CompanyProfile.find(params[:id])
    @log = Log.create(description: "Edited new companyprofile"+" "+@company_profiles.name, user: current_user)
  end

  def update
    @company_profiles = CompanyProfile.find(params[:id])
    @company_profiles.update(company_profile_param)
    redirect_to @company_profiles
  end

  def destroy
    @company_profiles = CompanyProfile.destroy(params[:id])
    @log = Log.create(description: "Deleted new companyprofile"+" "+@company_profiles.name, user: current_user)
    redirect_to @company_profiles
  end
  def manage_company_profile
    @title="manage company_profile"
    @company_profiles = CompanyProfile.all
    add_breadcrumb "manage company_profile", :company_profile_path
  end

  private
  def company_profile_param
    params.require(:company_profile).permit(:name, :address, :vdc_mun, :ward_no, :phone_no, :vat_pan_no, :log_url, :district, :zone )
  end

end
