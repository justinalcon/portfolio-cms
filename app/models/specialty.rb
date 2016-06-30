class Specialty < ActiveRecord::Base
  validates_presence_of :name

  has_many :specialty_technologies
  has_many :technologies, through: :specialty_technologies
  has_many :organization_specialties
  has_many :organizations, through: :organization_specialties
  has_many :expertise_specialties
  has_many :expertise, through: :expertise_specialties
  has_many :project_specialties
  has_many :projects, through: :project_specialties

end
