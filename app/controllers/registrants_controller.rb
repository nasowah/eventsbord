class RegistrantsController < ApplicationController
  before_action :set_registrant, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index]

  # GET /registrants
  def index
    @registrants = Registrant.all
  end

  # GET /registrants/1
  # def show
  # end

  # GET /registrants/new
  def new
    @registrant = Registrant.new
    @event = Event.find(params[:event_id])
  end

  # GET /registrants/1/edit
  # def edit
  # end

  # POST /registrants
  def create
    @registrant = Registrant.new(registrant_params)
    @event = Event.find(params[:event_id])
    @registrant.event_id = @event.id

    if @registrant.save
      redirect_to root_url, notice: "You've successfully registered for the '#{@event.name}' event"
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /registrants/1
  # def update
  #   if @registrant.update(registrant_params)
  #     redirect_to @registrant, notice: 'Registrant was successfully updated.'
  #   else
  #     render action: 'edit'
  #   end
  # end

  # # DELETE /registrants/1
  # def destroy
  #   @registrant.destroy
  #   redirect_to registrants_url, notice: 'Registrant was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registrant
      @registrant = Registrant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registrant_params
      params.require(:registrant).permit(:first_name, :last_name, :mobile, :email, :ticket)
    end
end
