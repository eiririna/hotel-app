# frozen_string_literal: true

module Admin
  class RoomsController < ApplicationController
    before_action :admin_room, only: %i[edit update destroy]

    def index
      @admin_rooms = Admin::Room.all
    end

    def new
      @admin_room = Admin::Room.new
      authorize @admin_room
    end

    def edit; end

    def create
      @admin_room = Admin::Room.new(admin_room_params)
      authorize @admin_room
      if @admin_room.save
        @admin_room.images.attach(admin_room_params[:images])
        flash[:notice] = 'The room was created'
        redirect_to new_admin_room_path(@admin_room)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @admin_room.update(admin_room_params)
        flash[:notice] = 'The room was updated'
        redirect_to edit_admin_room_path(@admin_room)
      else
        flash[:notice] = 'The room was not updated'
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @admin_room.destroy
      flash[:notice] = 'Room successfully was deleted'
      redirect_to admin_rooms_url
    end

    private

    def admin_room
      @admin_room = Admin::Room.find(params[:id])
      authorize @admin_room
    end

    def admin_room_params
      params.require(:admin_room).permit(:name, :description, :price, images: [])
    end
  end
end
