class ReservationsController < ApplicationController
	respond_to :json
	
	def index
		@reservations = Reservation.all
	end
	
	def update
		@reservation = Reservation.find params[:id]
		if @reservation.update_attributes params
			render "reservations/show"
		else
			respond_with @reservation
		end
	end
	
	def create
		@reservation = Reservation.new
		if @reservation.update_attributes params
			render "reservations/show"
		else
			respond_with @reservation
		end
	end
	
end