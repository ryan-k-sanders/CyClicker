class Question < ActiveRecord::Base
  attr_accessible :number, :pollID, :questionText, :questionType
end
