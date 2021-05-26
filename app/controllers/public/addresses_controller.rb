class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!
  
  def index
    @addresses = current_customer.addresses
  	@address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
	  @address.customer_id = current_customer.id
    @addresses = current_customer.addresses
	  if @address.save
	  	 flash.now[:notice] = "新規配送先を登録しました"
	  redirect_to addresses_path

    end
  end
  
  def destroy
    @address = Address.find(params[:id])
	  @address.destroy
    @addresses = current_customer.address
    flash.now[:alert] = "配送先を削除しました"

	  redirect_to addresses_path
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
      @address = Address.find(params[:id])
      if @address.update(address_params)
      flash[:success] = "配送先を変更しました"
      redirect_to addresses_path
      else
      render "edit"
      end
  end
  
  private

  def address_params
  	params.require(:address).permit(:postal_code, :address, :name)
  end
  
end
