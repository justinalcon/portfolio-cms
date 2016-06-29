class Spark < ActiveRecord::Base
	belongs_to :user
	has_many :images, :dependent => :destroy, :inverse_of => :spark
	has_many :spark_tags
	has_many :tags, through: :spark_tags

	mount_uploader :canned_video, VideoUploader

	validates_presence_of :title
  validates_presence_of :summary

	video_url_regex = /https:\/\/(?:www.)?(vimeo|youtube|youtu).(com|be)/
	validates_format_of :video_url, with: video_url_regex, allow_blank: true

	accepts_nested_attributes_for :images, :allow_destroy => true

	after_initialize do
    if new_record?
    	user = Thread.current.thread_variable_get(:current_user)
      user.blank? ? self.user_id ||= 1 : self.user_id ||= user
    end
  end

	def self.default_scope
  	user = Thread.current.thread_variable_get(:current_user)
  	if(user.blank? || user.role == User::ROLE_ADMIN)
  		all
  	else
  		where(user_id: user.id)
  	end 	
  end

  def self.published
  	where(published: 1).order(created_at: :desc)
  end
  
end
