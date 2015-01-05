class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.profile.nil?
        @closest_coaches = Coach.first(3)
        @closest_gyms = Gym.first(3)
      else
        @closest_coaches = Coach.closest_coaches(current_user.profile.zipcode)
        @closest_gyms = Gym.closest_gyms(current_user.profile.zipcode)
      end
    end
  end
end
