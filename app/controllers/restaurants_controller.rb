class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurant
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
      flash[:success] = "Object successfully created"
      redirect_to @restaurant
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
end
