class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
  def index
    @orders = Order.page(params[:page]).per(10)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスの変更しました"
      redirect_to admin_order_path(@order)
    else
      
      render :show
    end
    
  end
  
  def today_order_index
    
  end
  
  def current_index
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
end
