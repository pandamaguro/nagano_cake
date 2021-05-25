class Admin::SearchController < ApplicationController
  before_action :authenticate_admin!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    if @model == 'customer'
      @records = Customer.search_for(@content,@method)
    else
      @records = Item.search_for(@content, @method)
    end
  end
end
