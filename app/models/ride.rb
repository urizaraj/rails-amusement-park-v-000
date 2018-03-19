class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    errors = []
    errors << "You do not have enough tickets to ride the #{attraction.name}." if self.user.tickets < self.attraction.tickets
    errors << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height

    return "Sorry. #{errors.join(' ')}" if errors.size > 0

    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
