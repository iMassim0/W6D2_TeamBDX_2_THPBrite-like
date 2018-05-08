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

def creator(events)
  @current_user = current_user
  @created_events = []
  events.each do |event|
      if event.creator_id == @current_user.id
        @created_events << event
      end
    end
  end
end
