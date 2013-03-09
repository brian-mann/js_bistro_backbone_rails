class ReservationsController < ApplicationController
	respond_to :json
	
	def index
		@reservations = Reservation.all
	end
end