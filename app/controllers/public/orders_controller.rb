class Public::OrdersController < ApplicationController
 
  include ApplicationHelper
  before_action :authenticate_customer!
  
  def index
    @orders = current_customer.orders
  end

  def show

  end

  def new
    @order = Order.new
    @address = Address.all
  end

  def confirm
    @cart_items = current_customer.cart_items
    
    @order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method])
    
    # total_paymentに請求額を入れる billingはhelperで定義
    @order.total_payment = billing(@order)
    
    # my_addressに1が入っていれば（自宅）
    if params[:order][:my_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = full_name(current_customer)
      
    # my_addressに2が入っていれば（配送先一覧）
    elsif params[:order][:my_address] == "2"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name
      
    # my_addressに3が入っていれば(新配送先)
    elsif params[:order][:my_address] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @ship = "1"
    
    # 有効かどうかの確認 
      unless @order.valid? == true
        @addresses = Address.where(customer: current_customer)
        render :new
      end
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to thanx_orders_path
    # 情報入力に新規配送先があれば保存
    if params[:order][:ship] =="1"
      current_customer.address.create(address_params)      
    end
    
    # カート商品の情報を注文履歴に移動させる
    @cart_items = current_cart
    @cart_items.each do |cart_item|
      OrderDetail.create(
        item: cart_item.item,
        order: @order,
        count: cart_item.count,
        price: @order.total_payment
        )
      end

    # 最後にカートを全て削除する
      @cart_items.destroy_all
  end

  def thanx
  end
  
  private
  
    def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment)
    end
    
    def address_params
      params.require(:order).permit(:postal_code, :address, :name)
    end
  

  end
end
