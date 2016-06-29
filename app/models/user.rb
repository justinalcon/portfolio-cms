class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable, :timeoutable

  has_many :sparks

  validates_presence_of :email, :role, :username
  ROLE_ADMIN = "admin"
  ROLE_TECH = "tech"
  ROLE_NONTECH = "nontech"

  def self.default_scope
  	user = Thread.current.thread_variable_get(:current_user)
  	if(user.blank? || user.role == ROLE_ADMIN)
  		all
  	else
  		where(id: user.id)
  	end
  end

  def role_enum 
    [['nontech'],['tech'],['admin']]
  end

end
