class OrganizationSpecialty < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :organization
end