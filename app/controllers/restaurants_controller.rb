class RestaurantsController < ApplicationController

  before_action :set_restaurants, only: [:show]

  def index         # GET /restaurants
    @restaurants = Restaurant.all
  end

  # --------------------

  def show          # GET /restaurants/:id
  end

  # --------------------
  def new           # GET /restaurants/new
    @restaurant = Restaurant.new
  end

  def create        # POST /restaurants
    @restaurant = Restaurant.new(restaurant_params)
    # raise
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
      # redirect_to restaurants_path
    else
      render :new
    end

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end

end
