class FiscalYearsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Fiscal_years", :fiscal_years_path
  def new
    add_breadcrumb "New", :new_fiscal_year_path
    @fiscal_years = FiscalYear.new
  end

  def create
    @fiscal_years = FiscalYear.new(fiscal_years_param)
    if @fiscal_years.save
      @log = Log.create(description: "Added new fiscalyear"+" "+@fiscal_years.name, user: current_user)
      redirect_to @fiscal_years
    else
      render 'new'
    end
  end

  def show
    @fiscal_years = FiscalYear.find(params[:id])
  end

  def index

    @fiscal_years = FiscalYear.all
  end


  def edit
    @fiscal_years = FiscalYear.find(params[:id])
    @log = Log.create(description: "Edited new fiscalyear"+" "+@fiscal_years.name, user: current_user)
  end

  def update
    @fiscal_years = FiscalYear.find(params[:id])
    @fiscal_years.update(fiscal_years_param)
    redirect_to @fiscal_years
  end

  def destroy
    @fiscal_years = FiscalYear.destroy(params[:id])
    @log = Log.create(description: "Deleted new fiscalyear"+" "+@fiscal_years.name, user: current_user)
    redirect_to @fiscal_years
  end
  def manage_fiscal_years
    @title="manage fiscal_years"
    @fiscal_years = FiscalYear.all
    add_breadcrumb "manage items", :fiscal_years_path
  end

  private
  def fiscal_years_param
    params.require(:fiscal_year).permit(:name, :start_date, :end_date)
  end

end
