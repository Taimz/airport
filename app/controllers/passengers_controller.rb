class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]

  # GET /passengers
  # GET /passengers.json
  def index
    @passengers = Passenger.all

    respond_to do |format|
      format.html
      format.json { render json: @passengers }
    end
  end

  # GET /passengers/1
  # GET /passengers/1.json
  def show
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers
  # POST /passengers.json
  def create
    @passenger = Passenger.new(passenger_params)

    flight = Flight.find_by_id(params[:passenger][:flight_id])

    if flight.present?
      if flight.passengers.count >= flight.capacity
        error = "Flight is full"
      end
      @passenger.flights << flight
      @passenger.save
    else
      error = "Flight not found"
    end

    respond_to do |format|
      if @passenger.errors.empty? and flight.present?
        format.html { redirect_to @passenger, notice: 'Passenger was successfully created.' }
        format.json { render json: @passenger, status: :created }
      else
        format.html { render :new }
        format.json { render json: error || @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passengers/1
  # PATCH/PUT /passengers/1.json
  def update
    respond_to do |format|
      if @passenger.update(passenger_update_params)
        format.html { redirect_to @passenger, notice: 'Passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1
  # DELETE /passengers/1.json
  def destroy
    @passenger.bookings.destroy
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to passengers_url, notice: 'Passenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_params
      params.require(:passenger).permit(:name, :email, :phone_number)
    end

    # passenger update params
    def passenger_update_params
      params.require(:passenger).permit( :email, :phone_number)
    end
end
