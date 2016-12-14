require 'bcrypt'

class User

include DataMapper::Resource

property :id, Serial
property :name, String
property :email, String, :unique => true
property :password_digest, Text, :required => true

has n, :requests, :through => Resource

attr_accessor :password_confirmation
attr_reader :password

validates_presence_of :email
validates_presence_of :password
validates_format_of :email, :as => :email_address
validates_confirmation_of :password

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

def self.authenticate(email, password)
  user = first(email: email)
  if user && BCrypt::Password.new(user.password_digest) == password
    user
  else
    nil
  end
end

end
