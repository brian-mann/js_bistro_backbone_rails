class Reservation < ActiveRecord::Base
  attr_accessible :confirmation_id, :name, :number, :party

	validates_presence_of :name, :number, :party	
	validates_numericality_of :party
end
