class CustomersController < ApplicationController
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Customer", :customers_path
    def new
      add_breadcrumb "New", :new_customer_path
      @customers = Customer.new
    end

    def create
      @customers = Customer.new(customer_param)
      if @customers.save
        @log = Log.create(description: "Added new customer"+" "+@customers.name, user: current_user)
        redirect_to @customers
      else
        render 'new'
      end
    end

    def show
      @customers = Customer.find(params[:id])
    end

    def index
      @customers = Customer.all
    end


    def edit
      @customers = Customer.find(params[:id])
      @log = Log.create(description: "Edited new customer"+" "+@customers.name, user: current_user)
    end

    def update
      @customers = Customer.find(params[:id])
      @customers.update(customer_param)
      redirect_to @customers
    end

    def destroy
      @customers = Customer.destroy(params[:id])
      @log = Log.create(description: "Deleted new customer"+" "+@customers.name, user: current_user)
      redirect_to @customers
    end
    def manage_items
      @title="manage customer"
      @customers = Customer.all
      add_breadcrumb "manage customer", :customer_path
    end

    private
    def customer_param
      params.require(:customer).permit(:name, :address, :phone_no, :email)
    end


end
