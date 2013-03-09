attributes :id, :confirmation_id, :name, :number, :party, :created_at, :updated_at

node do |reservation|
	{
		:created_at_int => reservation.created_at.to_i
	}
end