class HomeController < ApplicationController
  def index
    if user_signed_in?
      @events = Event.all
      events_aging(@events)
      creator(@events)
    else
      flash[:danger] = "Veuillez vous connecter pour accéder à la liste des évènements."
      redirect_to new_user_session_path
    end
  end

  def admin
    @users = User.all
  end

end
