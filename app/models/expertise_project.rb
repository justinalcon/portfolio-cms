class ExpertiseProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :expertise
end