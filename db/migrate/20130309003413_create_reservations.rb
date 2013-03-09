class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :confirmation_id
      t.string :name
      t.string :number
      t.integer :party

      t.timestamps
    end
  end
end
