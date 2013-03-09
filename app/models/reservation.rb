class Reservation < ActiveRecord::Base
	default_scope order "created_at DESC"
	
  attr_accessible :confirmation_id, :name, :number, :party

	validates_presence_of :name, :number, :party	
	validates_numericality_of :party
end
