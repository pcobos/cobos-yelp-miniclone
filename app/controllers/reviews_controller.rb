class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new    
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = "Boy, we did it"
      redirect_to @review
    else 
      flash[:error] = "Houston, we have a problem"
      render 'new'
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  
end
