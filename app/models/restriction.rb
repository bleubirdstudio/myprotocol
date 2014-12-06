class Restriction < ActiveRecord::Base
  has_many :profile_restrictions
  has_many :profiles, through: :profile_restrictions
end
