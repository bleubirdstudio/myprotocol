class ProfileGoal < ActiveRecord::Base
  belongs_to :profile
  belongs_to :goal
end
