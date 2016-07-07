class Image < ActiveRecord::Base
  belongs_to :technology, :inverse_of => :images
  belongs_to :specialty, :inverse_of => :images
  belongs_to :expertise, :inverse_of => :images
  belongs_to :organization, :inverse_of => :images
  belongs_to :project, :inverse_of => :images

  validates_presence_of :location

  mount_uploader :location, ImageUploader

  def name
    location_identifier
  end

end