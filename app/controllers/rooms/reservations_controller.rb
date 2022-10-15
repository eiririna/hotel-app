# frozen_string_literal: true

module Rooms
  class ReservationsController < ApplicationController
    before_action :authenticate_user!

    def new
      @reservation = Reservation.new
    end

    def create
      @reservation = Reservation.new(reservation_params)
      @room = Room.find(params[:room_id])
      @reservation.room_id = @room.id
      @reservation.user_id = current_user.id unless current_user.id.nil?

      if @reservation.check_in_date.nil? || @reservation.check_out_date.nil? || @reservation.check_in_date < Time.now.getlocal || @reservation.check_in_date >= @reservation.check_out_date
        flash[:notice] =
          'Wrong dates. You have chosen dates that have already passed, or you have incorrectly specified the order of arrival and departure.'
      elsif @reservation.save
        flash[:notice] =
          'Reservation was successfully created. Have a good rest. We are looking forward to seeing you at our hotel!'
      end
      redirect_to room_path(@room.id)
    end

    private

    def reservation_params
      params.require(:reservation).permit(:check_in_date, :check_out_date)
    end
  end
end
