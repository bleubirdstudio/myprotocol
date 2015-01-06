class Gym < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: { in: Coach::STATES }
  validates :zip, presence: true

  geocoded_by :full_street_address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def full_street_address
    [street, city, state, zip].join(', ')
  end

  def self.closest_gyms(zipcode)
    answer = near(zipcode, 50).to_a
    if answer.empty?
      answer = first(3)
    elsif answer.size > 3
      answer = answer.first(3)
    else
      while answer.size < 3
        answer << all.sample
      end
    end
    answer
  end
end
