class CoachesController < ApplicationController
  before_action :set_coach, only: [:show, :edit, :update, :destroy]

  def index
    @coaches = Coach.all
  end

  def show
  end

  def new
    @coach = Coach.new
  end

  def edit
  end

  def create
    @coach = Coach.new(coach_params)
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
    params[:coach]
  end
end
