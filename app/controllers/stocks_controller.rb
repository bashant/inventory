class StocksController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Stocks", :stocks_path
  def new
    add_breadcrumb "New", :new_stock_path
    @stocks = Stock.new
  end

  def create
    @stocks = Stock.new(stocks_param)
    if @stocks.save
      @log = Log.create(description: "Added new stock"+" "+@stocks.name, user: current_user)
      redirect_to @stocks
    else
      render 'new'
    end
  end

  def show
    @stocks = Stock.find(params[:id])
  end

  def index
    @stocks = Stock.all
  end


  def edit
    @stocks = Stock.find(params[:id])
    @log = Log.create(description: "Edited new stock"+" "+@stocks.name, user: current_user)
  end

  def update
    @stocks = Stock.find(params[:id])
    @stocks.update(stocks_param)
    redirect_to @stocks
  end

  def destroy
    @stocks = Stock.destroy(params[:id])
    @log = Log.create(description: "Deleted new stock"+" "+@stocks.name, user: current_user)
    redirect_to @stocks
  end
  def manage_stocks
    @title="manage stocks"
    @Stocks = Stock.all
    add_breadcrumb "manage stocks", :stocks_path
  end

  private
  def stocks_param
    params.require(:stock).permit(:name, :item_id, :quantity, :unit_price, :est_sell_price)
  end
end
