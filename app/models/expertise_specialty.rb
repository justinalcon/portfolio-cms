class ExpertiseSpecialty < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :expertise
end