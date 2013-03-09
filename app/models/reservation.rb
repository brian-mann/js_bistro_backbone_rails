class Reservation < ActiveRecord::Base
  attr_accessible :confirmation_id, :name, :number, :party
end
