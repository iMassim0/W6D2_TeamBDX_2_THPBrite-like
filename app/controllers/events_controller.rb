class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    if user_signed_in?
      @current_user = current_user
      @event = Event.new(params_event)
      @event.creator_id = @current_user.id
      @event.save
      if @event.save
        redirect_to event_path(@event.id)
      else
        flash.now[:danger] = "Couldn't save."
        render action: "new"
      end
    else
      redirect_to new_user_session_path
    end
  end

  def index
    if user_signed_in?
      @events = Event.all
      events_aging(@events)
      @attending_list = attending?
    else
      flash[:danger] = "Veuillez vous connecter pour accéder à la liste des évènements."
      redirect_to new_user_session_path
    end
  end

  def show
    if user_signed_in?
      @event = Event.find(params[:id])
      @attending_list = attending?
    else
      redirect_to new_user_session_path
    end
  end

  def subscribe
    @event = Event.find(params[:event])
    @current_user = current_user
    @event.attendees << @current_user
    flash[:success] = "Tu as bien rejoint l'évènement !!"
    redirect_to user_path(@current_user.id)
  end

  def unsubscribe
    @event = Event.find(params[:event])
    @current_array = []
    @current_array << current_user
    @event.attendees -= @current_array
    flash[:success] = "Tu as bien quitté l'évènement !!"
    redirect_to user_path(@current_user.id)
  end

  private

  def params_event
    params.require(:event).permit(:description, :date, :place)
  end

end
