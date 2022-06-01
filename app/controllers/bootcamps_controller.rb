class BootcampsController < ApplicationController
  def index
    @bootcamps = policy_scope(Bootcamp).order(created_at: :desc)
    @bootcamps = Bootcamp.all
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
    authorize @bootcamp
  end

  def new
    @bootcamp = Bootcamp.new
    authorize @bootcamp
  end

  def edit
    @bootcamp = Bootcamp.find(params[:id])
  end

  def create
    @bootcamp = Bootcamp.new(bootcamp_params)
    authorize @bootcamp
    @bootcamp.user = current_user
    if @bootcamp.save
      redirect_to @bootcamp
    end
  end

  def update
  end

  def destroy
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamp.destroy
    redirect_to @bootcamp.index
  end

  private

  def bootcamp_params
    params.require(:bootcamp).permit(:user_id, :address, :name, :pc_number, :price)
  end
end
