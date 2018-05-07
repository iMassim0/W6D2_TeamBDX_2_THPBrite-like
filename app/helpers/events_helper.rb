module EventsHelper

  def events_aging(events)
    @upcoming = []
    @past = []
    events.each do |event|
        if event.date > Time.now
          @upcoming << event
        else
          @past << event
        end
    end
    @upcoming
    @past
  end

  def attending?
    @attending = []
    if !current_user.attending_events == nil 
    current_user.attending_events.each do |event|
      if event.date > Time.now
        @attending << event
      end
    end
    end


  end

end
