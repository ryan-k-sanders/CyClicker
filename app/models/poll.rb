class Poll < ActiveRecord::Base
  attr_accessible :courseCode, :name, :open
end
