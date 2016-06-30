class Specialty < ActiveRecord::Base
  validates_presence_of :name

  #has_many :technologies, through: :specialty_technologies
  #has_many :organizations, through: :organization_specialties
  #has_many :expertise, through: :expertise_specialties

end
