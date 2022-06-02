class BootcampsController < ApplicationController
  def index
    @bootcamps = Bootcamp.all
    @markers = @bootcamps.geocoded.map do |bootcamp|
      {
        lat: bootcamp.latitude,
        lng: bootcamp.longitude
      }
    end
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
    @markers = [
      {
        lat: @bootcamp.latitude,
        lng: @bootcamp.longitude
      }]
  end

  def new
    @bootcamp = Bootcamp.new
  end

  def edit
    @bootcamp = Bootcamp.find(params[:id])
  end

  def create
    @bootcamp = Bootcamp.new(bootcamp_params)
    @bootcamp.user = current_user
    if @bootcamp.save
      redirect_to @bootcamp
    else
      render :new
    end
  end

  def update
    @bootcamp = Bootcamp.find(params[:id])
    if @bootcamp.update(bootcamp_params)
      redirect_to @bootcamp, notice: 'Bootcamp was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamp.destroy
    redirect_to bootcamps_path
  end

  private

  def bootcamp_params
    params.require(:bootcamp).permit(:user_id, :address, :name, :pc_number, :price, photos: [])
  end
end
