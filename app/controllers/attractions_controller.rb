class AttractionsController < ApplicationController
	before_action :set_attraction!, only: [:show, :edit, :update, :destroy]

	def index
		@attractions = Attraction.all
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.create(attraction_params)
		redirect_to @attraction
	end

	def show
	end

	def update
		@attraction.update(attraction_params)
	end

	def destroy
		@attraction.destroy
	end

	private

	def set_attraction!
		@attraction = Attraction.find_by_id(params[:id])
	end

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
	end
	
end