class AttractionsController < ApplicationController
  before_action :set_attraction, only: %i[show go_on_attraction edit update]

  def index
    @prefix = current_user.admin ? 'Show' : 'Go on'
    @attractions = Attraction.all
  end

  def go_on_attraction
    ride = Ride.new
    ride.attraction = @attraction
    ride.user = current_user
    ride.save
    flash[:notice] = ride.take_ride
    redirect_to current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(strong_params)
    return render :new unless attraction.save
    redirect_to attraction
  end

  def update
    @attraction.update(strong_params)
    redirect_to @attraction
  end

  private
  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def strong_params
    params.require(:attraction).permit(*%i[name nausea_rating happiness_rating tickets min_height])
  end
end
