class QuestionAnswersController < ApplicationController
  # GET /question_answers
  # GET /question_answers.json
  def index
    @question_answers = QuestionAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @question_answers }
    end
  end

  # GET /question_answers/1
  # GET /question_answers/1.json
  def show
    @question_answer = QuestionAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @question_answer }
    end
  end

  # GET /question_answers/new
  # GET /question_answers/new.json
  def new
    @question_answer = QuestionAnswer.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @question_answer }
    end
  end

  # GET /question_answers/1/edit
  def edit
    @question_answer = QuestionAnswer.find(params[:id])
  end

  # POST /question_answers
  # POST /question_answers.json
  def create
    @question_answer = QuestionAnswer.new(params[:question_answer])

    respond_to do |format|
      if @question_answer.save
        format.js { render :js => "redirect('"+edit_question_path(params[:question_answer][:questionID])+"', '"+"Question Answer Was Successfully Added"+"');"}
        format.html { redirect_to @question_answer, :notice => 'Question answer was successfully created.' }
        format.json { render :json => @question_answer, :status => :created, :location => @question_answer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @question_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /question_answers/1
  # PUT /question_answers/1.json
  def update
    @question_answer = QuestionAnswer.find(params[:id])

    respond_to do |format|
      if @question_answer.update_attributes(params[:question_answer])
        format.js { render :js => "redirect('"+edit_question_path(session[:current_question])+"', '"+"Question Answer Was Successfully Updated"+"');"}
        format.html { redirect_to @question_answer, :notice => 'Question answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @question_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /question_answers/1
  # DELETE /question_answers/1.json
  def destroy
    @question_answer = QuestionAnswer.find(params[:id])
    @question_answer.destroy

    respond_to do |format|
      format.js { render :js => "redirect('"+edit_question_path(session[:current_question])+"', '"+"Question Answer Was Successfully Deleted"+"');"}
      format.html { redirect_to question_answers_url }
      format.json { head :no_content }
    end
  end
end
