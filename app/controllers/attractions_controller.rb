class AttractionsController < ApplicationController
  before_action :set_attraction, only: %i[show go_on_attraction]

  def index
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

  private
  def set_attraction
    @attraction = Attraction.find(params[:id])
  end
end
