class Project < ActiveRecord::Base
  validates_presence_of :name

  has_many :project_technologies
  has_many :technologies, through: :project_technologies
  has_many :organization_projects
  has_many :organizations, through: :organization_projects
  has_many :project_specialties
  has_many :specialties, through: :project_specialties
  has_many :expertise_projects
  has_many :expertise, through: :expertise_projects

end
