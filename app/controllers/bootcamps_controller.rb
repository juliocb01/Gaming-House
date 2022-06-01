class BootcampsController < ApplicationController
  def index
    @bootcamps = policy_scope(Bootcamp).order(created_at: :desc)
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
  end

  def create
    @bootcamp = Bootcamp.new(bootcamp_params)
    authorize @bootcamp
    @bootcamp.user = current_user
    if @bootcamp.save
      redirect_to @bootcamp
    else
      puts @bootcamp.errors.full_messages
      render :new
    end
  end

  def update
    if @bootcamp.update(bootcamp_params)
      redirect_to @bootcamp, notice: 'Bootcamp was successfully updated.'
    else
      render :edit
    end
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
