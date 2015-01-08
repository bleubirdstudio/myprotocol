class CoachesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_coach, only: [:show, :edit, :update, :destroy]

  def index
    @coaches = Coach.all
  end

  def show
  end

  def new
    if current_user.coach.nil?
      @coach = Coach.new(user: current_user)
    else
      redirect_to action: 'edit', id: current_user.coach.id
    end
  end

  def edit
  end

  def create
    @coach = Coach.new(coach_params)

    @coach.user = current_user

    if @coach.save
      redirect_to @coach, notice: 'Coach was successfully created.'
    else
      render :new
    end
  end

  def update
    if @coach.update(coach_params)
      redirect_to @coach, notice: 'Coach was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @coach.destroy
    redirect_to coaches_url, notice: 'Coach was successfully destroyed.'
  end

private
  def set_coach
    @coach = Coach.find(params[:id])
  end

  def coach_params
    params.require(:coach).permit(:name, :business, :street, :city, :state, :zip, :phone_number, :certifications, :bio, :quote, :quoter, :shirt_size, :image)
  end
end
