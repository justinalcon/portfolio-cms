class Expertise < ActiveRecord::Base
  validates_presence_of :name

  has_many :expertise_technologies
  has_many :technologies, through: :expertise_technologies
  has_many :expertise_organizations
  has_many :organizations, through: :expertise_organizations
  has_many :expertise_specialties
  has_many :specialties, through: :expertise_specialties
  has_many :expertise_projects
  has_many :projects, through: :expertise_projects
end
