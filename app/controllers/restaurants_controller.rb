class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurant
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Object successfully created"
      redirect_to @restaurant
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private 
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
  
end
