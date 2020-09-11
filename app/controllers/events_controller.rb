class EventsController < ApplicationController
    def new
        # @event = helpers.current_user.created_events.build
        # byebug
    end

    def create
        byebug
        @event = Event.new(event_params)
        byebug
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
