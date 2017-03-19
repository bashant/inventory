class SuppliersController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Suppliers", :suppliers_path
  def new
    add_breadcrumb "New", :new_supplier_path
    @suppliers = Supplier.new
  end

  def create
    @suppliers = Supplier.new(suppliers_param)
    if @suppliers.save
      @log = Log.create(description: "Added new supplier"+" "+@suppliers.name, user: current_user)
      redirect_to @suppliers
    else
      render 'new'
    end
  end

  def show
    @suppliers = Supplier.find(params[:id])
  end

  def index
    @suppliers = Supplier.all
  end


  def edit
    @suppliers = Supplier.find(params[:id])
    @log = Log.create(description: "Edited new supplier"+" "+@suppliers.name, user: current_user)
  end

  def update
    @suppliers = Supplier.find(params[:id])
    @suppliers.update(suppliers_param)
    redirect_to @suppliers
  end

  def destroy
    @suppliers = Supplier.destroy(params[:id])
    @log = Log.create(description: "Deleted new supplier"+" "+@suppliers.name, user: current_user)
    redirect_to @suppliers
  end
  def manage_suppliers
    @title="manage suppliers"
    @Suppliers = Supplier.all
    add_breadcrumb "manage suppliers", :suppliers_path
  end

  private
  def suppliers_param
    params.require(:supplier).permit(:name, :address, :phone_no, :email)
  end
end
