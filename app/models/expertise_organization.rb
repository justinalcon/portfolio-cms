class ExpertiseOrganization < ActiveRecord::Base
  belongs_to :organization
  belongs_to :expertise
end