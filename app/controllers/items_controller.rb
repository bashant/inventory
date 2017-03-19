class ItemsController < ApplicationController
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Items", :items_path
    def new
      add_breadcrumb "New", :new_item_path
      @items = Item.new
      @itemsbuild_stocks
    end

    def create
      @items = Item.new(items_param)
      if @items.save
        @log = Log.create(description: "Added new item"+" "+@items.name, user: current_user)
        redirect_to @items
      else
        render 'new'
      end
    end

    def show
      @items = Item.find(params[:id])
    end

    def index
      @items = Item.all
    end


    def edit
      @items = Item.find(params[:id])
      @log = Log.create(description: "Edited new item"+ " "+@items.name, user: current_user)
    end

    def update
      @items = Item.find(params[:id])
      @items.update(items_param)
      redirect_to @items
    end

    def destroy
      @items = Item.destroy(params[:id])
      @log = Log.create(description: "Deleted new item"+" "+@items.name, user: current_user)
      redirect_to @items
    end
    def manage_items
      @title="manage items"
      @Items = Item.all
      add_breadcrumb "manage items", :items_path
    end

    private
    def items_param
      params.require(:item).permit(:name, :unit_id, :item_code, :quantity, :item_group_id, :expiry_date, :stocks_attributes, [:unit_price, :quantity, :est_sell_price, :description])
    end

  end
