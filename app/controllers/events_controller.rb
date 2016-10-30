class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.published.where(['lower(name) like ?', "%#{params[:search].downcase}%"])
    else
      @events = Event.published   
    end
  end

  def new
    @event = Event.new
  end

  def create
    
    if current_user
      @venue = Venue.find_or_create_by! name: params[:venue_name], full_address: params[:address], region_id: params[:region]

      @event = current_user.events.create!(name: params[:name], starts_at: params[:starts_at], 
                                           ends_at: params[:ends_at], hero_image_url: params[:hero_image_url], extended_html_description: "ahihi",
                                           venue_id: @venue.id, category_id: params[:category])

      if @event
        redirect_to new_event_ticket_path(@event)
        flash[:success] = "Successfully create event, now create tickets to publish"
      else
        redirect_to new_event_ticket_path(Event.new)
        flash[:error] = "Failed to save"
      end
    else
      redirect_to root_path
      flash[:error] = "Login first"

    end

  end

  def update
    @event = Event.find params[:id]
    @venue = @event.venue

    if @venue.update name: params[:venue_name], full_address: params[:address], region_id: params[:region]
      if @event.update(name: params[:name], starts_at: params[:starts_at], 
          ends_at: params[:ends_at], hero_image_url: params[:hero_image_url], extended_html_description: "ahihi", category_id: params[:category])

        flash[:success] = "Update event success"
      else
        flash[:error] = "Failed to update event"
      end
    else
      flash[:error] = "Failed to update event"
    end

    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find params[:id]
    @categories = Category.all
    @regions = Region.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def mine
    @events = current_user.events
  end

  def publish
    @event = Event.find params[:id]
    if current_user.events.include? @event 
      if @event.have_enough_ticket_types?
        @event.published_at = Time.now
        @event.save!
        flash[:success] = "Publish successfully, now every one can join your event"
        redirect_to events_path(@event)
      else
        flash[:error] = "You must have at least 1 ticket type to publish this event"
        redirect_to new_event_ticket_path(@event)
      end
    else
      flash[:error] = "You must be owner of this event to publish it"
      redirect_to events_path(@event)
    end
  end
end
