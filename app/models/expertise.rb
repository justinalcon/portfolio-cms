class Expertise < ActiveRecord::Base
  validates_presence_of :name

  #has_many :technologies, through: :expertise_technologies
  #has_many :organizations, through: :expertise_organizations
  #has_many :specialties, through: :expertise_specialties

end
