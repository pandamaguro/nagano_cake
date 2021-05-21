class Admin::CustomersController < ApplicationController
   before_action :authenticate_admin!
  def index
    @customers = Customer.all.page(params[:page]).per(10)
    
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to admin_customer_path
    else
      render 'edit'
    end
  end
   
  private
   def customer_params
     params.require(:customer).permit(
       :first_name,:last_name,:kana_first_name,:kana_last_name,:postal_code,:address,:phone_number,:email,:is_deleted)
   end
end
