class User < ActiveRecord::Base
    has_secure_password
    has_many :songs

    def name
        username
    end 

    def self.find_by_name(name)
        User.all.find{|user| user.name == name}
    end 

end 