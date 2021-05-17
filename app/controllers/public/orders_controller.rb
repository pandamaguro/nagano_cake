class Public::OrdersController < ApplicationController
  def index
    
  end
  
  def show
    
  end
  
  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end
  
  def confirm
    
  end
  
  def create
  
  end
  
  def thanx
    
  end  
end
