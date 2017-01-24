class User < ActiveRecord::Base
	validates :username, presence: true, 
		length: {minimum: 5, maximum: 25}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true,
		length: {minimum: 5, maximum: 50},
		format: {with: VALID_EMAIL_REGEX}
	has_many :articles
	has_secure_password 
end