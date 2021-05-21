class Admin::OrderDetailsController < ApplicationController
   before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    
    # 制作ステータスを「製作中(2)」→注文ステータスを「製作中(2)」
    if @order_detail.making_status == "製作中"
      @order.update(status: 2)
      flash[:notice] = "制作ステータスの更新しました。"
      @order.save
    end
    
    # 注文個数と制作完了になっている個数が同じならば  
    if @order.order_details.count == @order.order_details.where(making_status: 3).count
      @order.update(status: 3)
      flash[:notice] = "制作ステータスの更新しました。"
      @order.save
    end
    
    redirect_to request.referer
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :making_status, :count, :order_id)
  end
end
