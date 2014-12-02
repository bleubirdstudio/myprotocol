class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def index
  end

  def profile
  end
end
