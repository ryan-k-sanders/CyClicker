class Enrollment < ActiveRecord::Base
  attr_accessible :courseCode, :sectionNo, :studentID
end
