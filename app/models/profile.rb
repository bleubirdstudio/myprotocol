class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_restrictions
  has_many :restrictions, through: :profile_restrictions

  GENDERS = %w(M F)
  BODY_TYPES = %w(Fat Skinny sobt)
  BLOOD_TYPES = %w(A+ A- B+ B- AB+ AB- O+ O-)
  VEGGIE_OPTIONS = ['None', 'Not a lot', 'I know I need more', 'Just right', 'More then you know']

  validates :zipcode, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :body_type, presence: true, inclusion: { in: BODY_TYPES }
  validates :blood_type, presence: true, inclusion: { in: BLOOD_TYPES }
  validates :veggies_per_day, presence: true, inclusion: { in: VEGGIE_OPTIONS }
  validates :height, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: { only_integer: true }
  validates :waist, presence: true, numericality: { only_integer: true }

end
