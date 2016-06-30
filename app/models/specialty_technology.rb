class SpecialtyTechnology < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :technology
end