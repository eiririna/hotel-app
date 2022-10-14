# frozen_string_literal: true

class ReservationController < ApplicationController
  before_action :authenticate_user!

  def new
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.new
  end

  private

  def reservation_params
    params.permit(:checkin_date, :checkout_date)
  end
end
