class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    if current_user.profile.nil?
      @profile = Profile.new(user: current_user)
    else
      redirect_to action: 'edit', id: current_user.profile.id
    end
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)

    @profile.user = current_user

    if @profile.save
      redirect_to @profile, notice: 'poop.'
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:zipcode, :gender, :body_type, :birthday, :height, :weight, :waist, :blood_type, :veggies_per_day, :activity_level)
  end
end
