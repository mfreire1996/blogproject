class User < ActiveRecord::Base 
	has_one :profile
	has_many :posts
end 

#if statement for when you put in your email and password.
#when it is wrong password put an if statement and make it nill.



