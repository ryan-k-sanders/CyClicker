class EnrollmentsController < ApplicationController
  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @enrollments }
    end
  end

  def view_enrollments_for
    #render :text => "ddd"
    @enrollments = Enrollment.where(:studentID => session[:account].netid)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @enrollments }
    end
  end


  # GET /enrollments/new
  # GET /enrollments/new.json
  def new
    @enrollment = Enrollment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @enrollment }
    end
  end

  # GET /enrollments/1/edit
  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(params[:enrollment])

    respond_to do |format|
      if @enrollment.save
        format.js { render :js => "redirect('"+enrollments_url+"', '"+"Enrollment Was Successfully Created"+"');"}
        format.html { redirect_to @enrollment, :notice => 'Enrollment was successfully created.' }
        format.json { render :json => @enrollment, :status => :created, :location => @enrollment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @enrollment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy

    respond_to do |format|
      format.js { render :js => "redirect('"+enrollments_url+"', '"+"Enrollment Was Successfully Deleted"+"');"}
      format.html { redirect_to enrollments_url }
      format.json { head :no_content }
    end
  end

end
