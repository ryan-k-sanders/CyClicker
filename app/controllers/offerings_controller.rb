class OfferingsController < ApplicationController
  # GET /offerings
  # GET /offerings.json
  def index
    @offerings = Offering.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @offerings }
    end
  end

  # GET /offerings/1
  # GET /offerings/1.json
  def show
    @offering = Offering.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @offering }
    end
  end

  # GET /offerings/new
  # GET /offerings/new.json
  def new
    @offering = Offering.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @offering }
    end
  end

  # GET /offerings/1/edit
  def edit
    @offering = Offering.find(params[:id])
  end

  # POST /offerings
  # POST /offerings.json
  def create
    @offering = Offering.new(params[:offering])
    offeringCheck = Offering.where(:courseCode => params[:offering][:courseCode], :sectionNo => params[:offering][:sectionNo]).first
    respond_to do |format|
      if offeringCheck
        format.html { render :action => "new" }
        format.json { render :json => @offering.errors, :status => :unprocessable_entity }
        format.js { render :js => "redirect('"+url_for(:controller => 'offerings', :action => 'new')+"', '"+"That section already exists."+"');"}
      elsif @offering.save
        format.html { redirect_to @offering, :notice => 'Offering was successfully created.' }
        format.js { render :js => "redirect('"+offerings_path+"', '"+"Offering Was Successfully Created"+"');"}
        format.json { render :json => @offering, :status => :created, :location => @offering }
      else
        format.html { render :action => "new" }
        format.json { render :json => @offering.errors, :status => :unprocessable_entity }
        format.js { render :js => "redirect('"+url_for(:controller => 'offerings', :action => 'new')+"', '"+"Account Was Not Successfully Created"+"');"}
      end
    end
  end

  # PUT /offerings/1
  # PUT /offerings/1.json
  def update
    @offering = Offering.find(params[:id])
    offeringCheck = Offering.where(:courseCode => @offering.courseCode, :sectionNo => @offering).first
    respond_to do |format|
      if offeringCheck
        format.js { render :js => "redirect('"+url_for(:controller => 'offerings', :action => 'new')+"', '"+"That section already exists."+"');"}
      elsif @offering.update_attributes(params[:offering])
        format.html { redirect_to @offering, :notice => 'Offering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @offering.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1
  # DELETE /offerings/1.json
  def destroy
    @offering = Offering.find(params[:id])
    @offering.destroy

    respond_to do |format|
      format.js { render :js => "redirect('"+offerings_url+"', '"+"Offering Was Successfully Deleted"+"');"}
      format.html { redirect_to offerings_url }
      format.json { head :no_content }
    end
  end

  def instructed_by
    @offerings = Offering.where(:instructorID => session[:account].netid)
  end

end
