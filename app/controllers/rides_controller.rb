class RidesController < ApplicationController

	def new
		@ride = Ride.new(user_id: params[:user][:id], attraction_id: params[:attraction][:id])
		@message = @ride.take_ride
		flash[:notice] = @message
		redirect_to user_path(current_user)
	end

end
