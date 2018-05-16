class ReviewsController < ApplicationController

  before_action :set_restaurant, only: [:new, :create]

  # --------------------
  def new           # GET /reviews/new

    @review = Review.new
  end

  def create        # POST /reviews
    @review = Review.new(review_params)
    # raise
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
