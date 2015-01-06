class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit]

  def index
    @gyms = Gym.all
  end

  def show
  end

  def new
    @gym = Gym.new
  end

  def edit
  end

  def create
    @gym = Gym.new(gym_params)

    @gym.user = current_user

    if @gym.save
      redirect_to @gym, notice: 'Gym was successfully created.'
    else
      render :new
    end
  end



  def update
    if current_user.gym.update(gym_params)
      redirect_to @gym, notice: 'Gym was successfully updated.'
    else
      render :edit
    end
  end



  def destroy
    current_user.gym.destroy
    redirect_to gyms_url, notice: 'Gym was successfully destroyed.'
  end

  private
    def set_gym
      @gym = Gym.find(params[:id])
    end

    def gym_params
      params.require(:gym).permit(:name, :street, :city, :state, :zip, :image)
    end
end
