class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find_by(params[:id])
    @order_details = @order.order_details
  end

  def new
    @order = Order.new
    @address = Address.all
  end

  def confirm

  end

  def create

  end

  def thanx

  end
end
