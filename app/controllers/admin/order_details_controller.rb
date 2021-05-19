class Admin::OrderDetailsController < ApplicationController
   before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    
    @order = @order_detail.order
    
    if @order.order_details.where(making_status: '製作中').count > 0
      @order.order_status = '製作中'
      @order.save
    end
    
    if @order.order_details.where(making_status: '制作完了').count == @order.order_details.count
      @order.status = '発送準備中'
      @order.save
    end
    
    redirect_to request.referer
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :making_status, :count)
  end
end
