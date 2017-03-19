class PurchasesController < ApplicationController
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Purchase", :purchases_path
    def new
      add_breadcrumb "New", :new_purchase_path
      @purchases = Purchase.new
      @purchases.purchase_item.build
    end

    def create
      @purchases = Purchase.new(purchases_param)
      if @purchases.save

        redirect_to @purchases
      else
        render 'new'
      end
    end

    def show
      @purchases = Purchase.find(params[:id])
    end

    def index
      @purchases = Purchase.all
    end


    def edit
      @purchases = Purchase.find(params[:id])
    end

    def update
      @purchases = Purchase.find(params[:id])
      @purchases.update(purchase_param)
      redirect_to @purchases
    end

    def destroy
      @purchases = Purchase.destroy(params[:id])

      redirect_to @purchases
    end
    def manage_items
      @title="manage purchases"
      @purchases = Purchase.all
      add_breadcrumb "manage purchase", :purchase_path
    end

    private
    def purchases_param
      params.require(:purchase).permit(:supplier_id, :price, :vat, :discount, :total, :date, :unit, :item,  :purchase_items_attributes, [:item, :quantity, :unit_price, :total])
    end

  end
