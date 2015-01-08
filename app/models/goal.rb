class Goal < ActiveRecord::Base
  has_many :profile_goals
  has_many :profiles, through: :profile_goals
end
