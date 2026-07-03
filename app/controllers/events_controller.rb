class EventsController < ApplicationController
  before_action :require_user
  def show
    @event = Event.includes(:vendors).find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event # Redirects to the event show page
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :title, :location)
  end
end