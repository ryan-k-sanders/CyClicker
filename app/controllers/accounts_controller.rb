class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    if params[:account_type] == "student"
      @accounts = Account.where(:account_type => "student").all
      @only_showing = "Students"
    elsif params[:account_type] == "ta"
      @accounts = Account.where(:account_type => "ta").all
      @only_showing = "TAs"
    elsif params[:account_type] == "instructor"
      @accounts = Account.where(:account_type => "instructor").all
      @only_showing = "Instructors"
    elsif params[:account_type] == "admin"
      @accounts = Account.where(:account_type => "admin").all
      @only_showing = "Administrators"
    else
      @accounts = Account.all
      @only_showing = "Accounts"
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, :notice => 'Account was successfully created.' }
        format.js { render :js => "redirect('"+account_path(@account)+"', '"+"Account Was Successfully Created"+"');"}
        format.json { render :json => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.json { render :json => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, :notice => 'Account was successfully updated.' }
        format.js { render :js => "redirect('"+account_path(@account)+"', '"+"Account Was Successfully Updated"+"');"}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    if @account.netid != "admin"
      @account.destroy
          respond_to do |format|
            format.html { redirect_to accounts_url }
            format.js { render :js => "redirect('"+accounts_url+"', '"+"Account Was Successfully Deleted"+"');"}
            format.json { head :no_content }
          end
    else
          respond_to do |format|
            format.html { redirect_to accounts_url }
            format.js { render :js => "redirect('"+accounts_url+"', '"+"Account Was Successfully Deleted"+"');"}
            format.json { head :no_content }
          end
    end

  end

end
