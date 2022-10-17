# frozen_string_literal: true

module Admin
  class ReservationsController < ApplicationController
    before_action :admin_reservation, only: %i[update destroy]

    def index
      @admin_reservations = Admin::Reservation.all.where(confirmed: false).order(created_at: :desc)
      authorize @admin_reservations
      @reservations_confirmed = Reservation.where(confirmed: true).order(created_at: :desc)
      respond_to do |format|
        format.html
        format.csv do
          send_data @reservations_confirmed.to_csv,
                    filename: "reservations-#{Time.zone.today}.csv"
        end
        format.xlsx
      end
    end

    def update
      flash[:notice] = if @admin_reservation.update(confirmed: true)
                         'Reservation was successfully confirmed'
                       else
                         'Reservation is not confirmed'
                       end
      redirect_to admin_reservations_path
    end

    def destroy
      @admin_reservation.destroy
      flash[:notice] = 'The reservation was destroyed'
      redirect_to admin_reservations_path
    end

    private

    def admin_reservation
      @admin_reservation = Admin::Reservation.find(params[:id])
    end
  end
end
