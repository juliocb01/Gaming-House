class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end
  #find(params[:id]) puxa pelo nome

  def new
    @bootcamp = Bootcamp.find(params[:bootcamp_id])
    @booking = Booking.new
    authorize @booking
  end

  def edit
  end

  def create
    @bootcamp = Bootcamp.find(params[:bootcamp_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bootcamp = @bootcamp
    if @booking.save
      redirect_to booking_path(@booking)
    else
      puts @booking.errors.full_messages
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  @booking = Booking.find(params[:id])
  @booking.destroy
  redirect_to @booking.index
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
