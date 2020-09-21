class EventsController < ApplicationController
  def index
    @events = Event.all
  end

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

  def show
    @event = Event.find(params[:id])
  end

  def register
    EventAttendee.create(event_id: params[:id], user_id: session[:user_id])
    flash[:notice] = 'Hello'
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_place, :event_date, :creator_id, :event_image)
  end
end
