class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def new
    
  end
  
  def create
    
  end
end
