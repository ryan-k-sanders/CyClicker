class PollsController < ApplicationController
  # GET /polls
  # GET /polls.json
  def index
    if session[:account].account_type == "admin"
      @polls = Poll.all
    else
      @courses = Offering.where(:instructorID => session[:account].netid)
      c = []
      @courses.each do |course|
        c.append course.courseCode
      end


      @polls = Poll.find_all_by_courseCode(c)
    end



    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @polls }
    end
  end

  def index_only
    @polls = Poll.where(:courseCode => params[:courseCode])
    session[:courseCode] = params[:courseCode]
    session[:current_course] = params[:courseCode]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @polls }
    end
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    @poll = Poll.find(params[:id])
    @questions = Question.where(:pollID => @poll.id)
    @student_answer = StudentAnswer.new
    @back = @poll.courseCode
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @poll }
    end
  end

  # GET /polls/new
  # GET /polls/new.json
  def new
    @poll = Poll.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @poll }
    end
  end

  # GET /polls/1/edit
  def edit
    @poll = Poll.find(params[:id])
    @questions = Question.where(:pollID => @poll.id)
    session[:current_course] = @poll.courseCode
    session[:current_poll] = @poll.id
    session[:current_poll] = @poll.id
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(params[:poll])

    respond_to do |format|
      if @poll.save
        format.js { render :js => "redirect('"+polls_url+"', '"+"Poll was created successfully"+"');"}
        format.html { redirect_to @poll, :notice => 'Poll was successfully created.' }
        format.json { render :json => @poll, :status => :created, :location => @poll }
      else
        format.html { render :action => "new" }
        format.json { render :json => @poll.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /polls/1
  # PUT /polls/1.json
  def update
    @poll = Poll.find(params[:id])

    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        format.js { render :js => "redirect('"+edit_poll_url(@poll)+"', '"+"Poll was deleted updated"+"');"}
        format.html { redirect_to @poll, :notice => 'Poll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @poll.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy

    respond_to do |format|
      format.js { render :js => "redirect('"+polls_url+"', '"+"Poll was deleted successfully"+"');"}
      format.html { redirect_to polls_url }
      format.json { head :no_content }
    end
  end
end
