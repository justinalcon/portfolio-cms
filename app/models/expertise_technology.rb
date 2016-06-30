class ExpertiseTechnology < ActiveRecord::Base
  belongs_to :expertise
  belongs_to :technology
end