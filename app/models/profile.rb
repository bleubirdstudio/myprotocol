class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_restrictions
  has_many :restrictions, through: :profile_restrictions

  GENDERS = %w(M F)
  BODY_TYPES = ['lean', 'toned', 'muscular', 'couple extra pounds', 'heavy']
  BLOOD_TYPES = %w(A+ A- B+ B- AB+ AB- O+ O-)
  VEGGIE_OPTIONS = ['None', 'Not a lot', 'I know I need more', 'Just right', 'More then you know']
  ACTIVITY_LEVELS = ['Zero Activity', 'Some Activity', 'Average Activity', 'More Active then normal', 'Extremely Active']

  validates :zipcode, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :activity_level, presence: true, inclusion: { in: ACTIVITY_LEVELS }
  validates :body_type, presence: true, inclusion: { in: BODY_TYPES }
  validates :blood_type, presence: true, inclusion: { in: BLOOD_TYPES }
  validates :veggies_per_day, presence: true, inclusion: { in: VEGGIE_OPTIONS }
  validates :height, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: { only_integer: true }
  validates :waist, presence: true, numericality: { only_integer: true }


  ##
  # English BMI Formula
  #   BMI = ( Weight in Pounds / ( Height in inches x Height in inches ) ) x 703
  #   Metric BMI Formula
  #   BMI = ( Weight in Kilograms / ( Height in Meters x Height in Meters ) )
  def bmi
    (weight/(height*height).to_f)*703
  end

  ##
  # Lean body mass is calculated by subtracting pounds
  # of fat from total weight. TW – BF pounds = LbM
  # we are using bmi as a percentage of BF relative to current weight
  # we get the BF pounds by multiplying the weight by the percentage
  # of weight that is fat (again using the bmi as the percentage)
  def lbm
    weight - (weight*(bmi/100.0))
  end

  def fish_oil
    "4g combo of Omega 3 and Omega 6."
  end

  def creatine
    if ['Zero Activity', 'Some Activity', 'Average Activity'].include?(activity_level)
      return "At this time we recommend increasing activity levels first"
    end

    if lbm >= 350
      if activity_level == 'More Active then normal'
        35
      elsif activity_level == 'Extremely Active'
        52.5
      end
    else
      if activity_level == 'More Active then normal'
        ((0.1)*lbm).round 2
      elsif activity_level == 'Extremely Active'
        ((0.15)*lbm).round 2
      end
    end
  end

  # bcaa recommendation in grams OR a verbal recommendation
  def bcaa
    if ['Zero Activity', 'Some Activity'].include?(activity_level)
      return 'No Need'
    end

    if lbm >= 300
      if activity_level == 'Average Activity'
        30
      elsif activity_level == 'More Active then normal'
        60
      elsif activity_level == 'Extremely Active'
        99
      end
    else
      if activity_level == 'Average Activity'
        ((0.1)*lbm).round 2
      elsif activity_level == 'More Active then normal'
        ((0.2)*lbm).round 2
      elsif activity_level == 'Extremely Active'
        ((0.33)*lbm).round 2
      end
    end
  end

  # protein recommendation in grams
  def protein
    if lbm >= 300
      if activity_level == 'Zero Activity'
        210
      elsif activity_level == 'Some Activity'
        225
      elsif activity_level == 'Average Activity'
        240
      elsif activity_level == 'More Active then normal'
        270
      elsif activity_level == 'Extremely Active'
        300
      end
    else
      (lbm * protein_coefficient).round 2
    end
  end

  def protein_coefficient
    if activity_level == 'Zero Activity'
      (0.6)
    elsif activity_level == 'Some Activity'
      (0.75)
    elsif activity_level == 'Average Activity'
      (0.8)
    elsif activity_level == 'More Active then normal'
      (0.9)
    elsif activity_level == 'Extremely Active'
      1
    end
  end
end
