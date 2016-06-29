class Tag < ActiveRecord::Base
  has_many :spark_tags
	has_many :sparks, through: :spark_tags

  validates_presence_of :tag

  def name 
  	tag
  end

end