class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
  end

  private
end
