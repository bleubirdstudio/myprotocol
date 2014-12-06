class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_restrictions
  has_many :restrictions, through: :profile_restrictions
end
