class Announcement < ActiveRecord::Base
	belongs_to :user
	has_many :announcements
	validates_presence_of :email, :password
  #ROLE_ADMIN = "admin"
  #ROLE_TECH = "tech"
  #ROLE_NONTECH = "nontech"
end
