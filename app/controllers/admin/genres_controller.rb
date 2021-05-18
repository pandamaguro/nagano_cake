class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def edit
     @genre = Genre.find(params[:id])
  end
  
  def create
    @genre = Genre.new(genre_params)
		if @genre.save
		  redirect_to admin_genres_path
		else
		  @genres = Genre.all
		  render :index
		end
    
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end
  
  private

	def genre_params
	  params.require(:genre).permit(:name)
	end
end
