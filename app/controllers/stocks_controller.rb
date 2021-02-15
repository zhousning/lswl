class StocksController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @stocks = current_user.stocks.all
  end
   

   
   
  def edit
    @stock = current_user.stocks.find(params[:id])
  end
   

   
  def update
    @stock = current_user.stocks.find(params[:id])
    if @stock.update(stock_params)
      redirect_to stocks_path 
    else
      render :edit
    end
  end
   
  #def show
  #  @stock = current_user.stocks.find(params[:id])
  #end
   

   
  #def new
  #  @stock = Stock.new
  #  
  #end
  # 

  # 
  #def create
  #  @stock = Stock.new(stock_params)
  #  #@stock.user = current_user
  #  if @stock.save
  #    redirect_to @stock
  #  else
  #    render :new
  #  end
  #end
   
  #def destroy
  #  @stock = Stock.find(params[:id])
  #  @stock.destroy
  #  redirect_to :action => :index
  #end
   

  

  

  private
    def stock_params
      params.require(:stock).permit( :position)
    end
  
  
  
end

