class Organization < ActiveRecord::Base
  validates_presence_of :name

  has_many :organization_technologies
  has_many :technologies, through: :organization_technologies
  has_many :expertise_organizations
  has_many :expertise, through: :expertise_organizations
  has_many :organization_specialties
  has_many :specialties, through: :organization_specialties
  has_many :organization_projects
  has_many :projects, through: :organization_projects

  has_many :images, :dependent => :destroy, :inverse_of => :organization

end
