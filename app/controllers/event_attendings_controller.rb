class EventAttendingsController < ApplicationController
  before_action :find_event
  before_action :find_event_attending, only: [:destroy]
  before_action :authenticate_user!, only: [:create]

  def create
    if already_attending?
      flash[:notice] = 'You are attending already.'
    else
      @event.event_attendings.create(event_attendee_id: current_user.id)
    end
    redirect_to @event
  end

  def destroy
    if !already_attending?
      flash[:notice] = 'Not able to attend.'
    else
      @event_attending.destroy
    end
    redirect_to @event
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_event_attending
    @event_attending = @event.event_attendings.find(params[:id])
  end

  def already_attending?
    EventAttending.where(event_attendee_id: current_user.id, attended_event_id: @event.id).exists?
  end
end