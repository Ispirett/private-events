class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params.merge(creator_id: session[:user_id]))
    if @event.save
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_place, :event_date, :creator_id)
  end
end
