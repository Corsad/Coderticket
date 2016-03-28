class User < ActiveRecord::Base
	has_secure_password
	has_many :event
	validates :email, uniqueness: true
	validates :name, presence: true
end
