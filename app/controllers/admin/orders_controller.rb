class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
  def index
    @orders = Order.page(params[:page]).per(10)
  end
  
  def show
    
  end
  
  def update
    
  end
  
  def today_order_index
    
  end
  
  def current_index
    
  end
  
end
