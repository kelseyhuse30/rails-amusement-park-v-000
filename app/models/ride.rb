class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
  	if not_enough_tickets && not_tall_enough
  		return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  	end

  	if not_enough_tickets
  		return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  	end

  	if not_tall_enough
  		return "Sorry. You are not tall enough to ride the #{attraction.name}."
  	end

  	user.tickets -= attraction.tickets
  	user.nausea += attraction.nausea_rating
  	user.happiness += attraction.happiness_rating
  	user.save
    return "Thanks for riding the #{attraction.name}!"
  	
  end

  private

  def not_tall_enough
  	attraction.min_height > user.height
  end

  def not_enough_tickets
  	attraction.tickets > user.tickets
  end

end
