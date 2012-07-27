class Account < ActiveRecord::Base
  attr_accessible :account_type, :name, :netid, :password, :picture_url, :tring
  ACCOUNT_TYPES = ['admin', 'instructor', 'ta', 'student']
end
