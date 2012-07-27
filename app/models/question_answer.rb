class QuestionAnswer < ActiveRecord::Base
  attr_accessible :answerText, :correctAnswer, :number, :questionID
end
