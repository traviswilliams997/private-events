class EventsController < ApplicationController

  before_action :set_event, only: %i[show edit]
  before_action :authenticate_user!, except: :index

  def index
    @events = Event.all
  end
  def show 
  end

  def new
    @event = current_user.created_events.build
  end

def create 

  @event = current_user.created_events.build(event_params)
  @event.creator_id = current_user.id

  if @event.save
    flash[:success] = "Event Successfully Created"

    redirect_to root_path
  else
    flash[alert] = @event.errors.count
    render :new, status: :unprocessable_entity, alert: 'Event not created'
  end
end 

  def edit 
  end

  private 
  def set_event
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event).permit(:title, :date, :location)
  end

end
