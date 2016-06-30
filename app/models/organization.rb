class Organization < ActiveRecord::Base
  validates_presence_of :name

  has_many :organization_technologies
  has_many :technologies, through: :organization_technologies
  #has_many :expertise, through: :expertise_organizations
  #has_many :specialties, through: :organization_specialties

end
