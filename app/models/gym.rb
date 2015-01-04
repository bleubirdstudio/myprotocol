class Gym < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: { in: Coach::STATES }
  validates :zip, presence: true

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [street, city, state, zip].join(', ')
  end
end
