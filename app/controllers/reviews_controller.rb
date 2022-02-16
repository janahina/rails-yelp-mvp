class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    #find the restaurant so we can get the id for the review
    @restaurant = Restaurant.find(params[:restaurant_id])
    #create a new review with params
    @review = Review.new(review_params)
    #set the restaurant
    @review.restaurant = @restaurant
    #save
    if @review.save
        redirect_to @restaurant, notice: 'Review was successfully created.'
      else
        render :new
      end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

# A visitor can add a new review to a restaurant
# GET "restaurants/38/reviews/new" NEW
# POST "restaurants/38/reviews" CREATE
# And that’s it!
