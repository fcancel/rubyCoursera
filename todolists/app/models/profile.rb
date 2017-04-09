class Profile < ApplicationRecord
  belongs_to :user, optional:true

  validates :gender, inclusion: { in: %w(male female), message: "%{value} is not a valid gender, only 'male' or 'female'" }

  validate :at_least_have_name_or_last_name
  validate :no_male_can_be_named_sue

  def at_least_have_name_or_last_name
    if first_name.nil? and last_name.nil?
      errors.add(:profile, "Can't have both name and last name be nil.")
    end
  end

  def no_male_can_be_named_sue
    if first_name.eql?('Sue') and gender.eql?('male')
      errors.add(:first_name, "%#{first_name} can't be Sue, because he is a male.")
    end
  end

  def self.get_all_profiles(min_birth_year, max_birth_year)
    where('birth_year between :min_birth_year and :max_birth_year', min_birth_year: min_birth_year, max_birth_year: max_birth_year).order(:birth_year).to_a
  end

end
