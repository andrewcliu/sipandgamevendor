class EventsController < ApplicationController
  before_action :require_user
  def show
    @event = Event.includes(:vendors).find(params[:id])
  end
  def edit
    @event = Event.find(params[:id])
  end
  def new
    @event = Event.new
  end
  def update
    @event = Event.find(params[:id])
    
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    # status: :see_other (303) is required by Turbo for DELETE redirects
    redirect_to root_path, notice: "Event was successfully deleted.", status: :see_other
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