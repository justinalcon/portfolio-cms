class Image < ActiveRecord::Base
  belongs_to :spark, :inverse_of => :images

  validates_presence_of :location

  mount_uploader :location, SparkImageUploader

  #special name for Rails Admin display for Sparks
  def name 
  	location_identifier
  end

end
