class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:organizer, :new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  # before_filter :authenticate_user!, except: [:index, :show]

  def organizer
    @events = Event.where(user: current_user).order("created_at DESC")
  end

  # GET /events
  def index
    @events = Event.all.order("created_at DESC")
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :description, :venue, :start_date, :end_date, :image, :price, :organizer, :phone)
    end

    def check_user
      if current_user != @event.user
        redirect_to root_url, alert: "Sorry, '#{@event.name}' event belongs to someone else."
      end
    end
end
