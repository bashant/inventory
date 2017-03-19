class UnitsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Units", :units_path
  def new
    add_breadcrumb "New", :new_unit_path
    @units = Unit.new
  end

  def create
    @units = Unit.new(units_param)
    if @units.save
      @log = Log.create(description: "Added new unit"+" "+@units.name, user: current_user)
      redirect_to @units
    else
      render 'new'
    end
  end

  def show
    @units = Unit.find(params[:id])
  end

  def index
    @units = Unit.all
  end


  def edit
    @units = Unit.find(params[:id])
    @log = Log.create(description: "Edited new unit"+" "+@units.name, user: current_user)
  end

  def update
    @units = Unit.find(params[:id])
    @units.update(units_param)
    redirect_to @units
  end

  def destroy
    @units = Unit.destroy(params[:id])
    @log = Log.create(description: "Deleted new unit"+" "+@units.name, user: current_user)
    redirect_to @units
  end
  def manage_units
    @title="manage units"
    @Units = Unit.all
    add_breadcrumb "manage units", :units_path
  end

  private
  def units_param
    params.require(:unit).permit(:name, :print_name)
  end
end
