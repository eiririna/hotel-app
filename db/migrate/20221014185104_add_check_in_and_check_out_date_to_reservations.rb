class AddCheckInAndCheckOutDateToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :check_in_date, :date, null: false
    add_column :reservations, :check_out_date, :date, null: false
  end
end
