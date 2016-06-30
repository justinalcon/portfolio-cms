class OrganizationTechnology < ActiveRecord::Base
  belongs_to :organization
  belongs_to :technology
end