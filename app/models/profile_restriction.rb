class ProfileRestriction < ActiveRecord::Base
  belongs_to :profile
  belongs_to :restriction
end
