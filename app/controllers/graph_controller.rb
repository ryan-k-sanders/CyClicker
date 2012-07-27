class GraphController < ApplicationController
  def view
    session[:current_question] = params[:id]
    @width = 200
    @height = 200
    if detect_browser == "application"
      @width = 400
      @height = 400
    end
  end

  def plot
    toReturn = []
    answer_counts = []
    num = QuestionAnswer.where(:questionID => params[:id]).count
    #num = 2
    total = 0
    i = 0
    while i < num  do
       answer_counts[i] = StudentAnswer.where(:questionID => params[:id], :number => (i + 1)).count
       total = total + answer_counts[i]
       i = i + 1;
    end

    i = 0
    while i < num do
      answer_counts[i] = (answer_counts[i] / (total + 0.0)) * 100
      toReturn.append answer_counts[i]
      i = i + 1;
    end
    render :json => toReturn


  rescue FloatDomainError
    render :json => []
  end

  def ticks
     @questionAnswers = QuestionAnswer.where(:questionID => session[:current_question]).all
     toReturn = []
     @questionAnswers.each do |answer|
          toReturn.append answer.answerText
     end
      render :text => toReturn
  end

end
