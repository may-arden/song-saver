class User < ActiveRecord::Base
    has_secure_password
    has_many :songs, dependent: :destroy 
    validates :username, presence: true, uniqueness: { message: "%value} is already in use. please select another username."}
end 