class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def index
    @orders = current_customer.orders
  end

  def show

  end

  def new

  end

  def confirm

  end

  def create

  end

  def thanx

  end
end
