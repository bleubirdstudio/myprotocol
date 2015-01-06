class Coach < ActiveRecord::Base

  STATES = %w(AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA PR RI SC SD TN TX UT VT VA WA WV WI WY)
  SIZES = %w(S M L XL)

  belongs_to :user

  validates :name, presence: true
  validates :business, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: { in: STATES }
  validates :zip, presence: true
  validates :phone_number, presence: true
  validates :bio, presence: true
  # validates :quote, presence: true
  # validates :quoter, presence: true
  validates :shirt_size, inclusion: { in: SIZES }

  geocoded_by :full_street_address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def full_street_address
    [street, city, state, zip].join(', ')
  end

  def self.closest_coaches(zipcode)
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
