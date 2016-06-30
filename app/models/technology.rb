class Technology < ActiveRecord::Base
  validates_presence_of :name

  has_many :organization_technologies
  has_many :organizations, through: :organization_technologies
  #has_many :expertise, through: :expertise_technologies
  #has_many :specialties, through: :specialty_technologies


end
