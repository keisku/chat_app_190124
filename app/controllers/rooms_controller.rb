class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all.order(:id)
  end

  def new
    @room = Room.new
    @room.save!
    redirect_to rooms_path
  end

  def show
    @room = Room.find_by(id: params[:id])
    @messages = @room.messages
  end
end