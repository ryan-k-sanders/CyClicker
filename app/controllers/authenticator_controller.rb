class AuthenticatorController < ApplicationController

  def authenticate
    account = Account.where(:netid => params[:netid]).first

    respond_to do |format|
      if account and (params[:netid]==account[:netid] and params[:password]==account[:password])
        session[:is_authenticated] = true
        session[:account] = account
        session[:account_type] = account.account_type
        format.js { render :js => "redirect('"+ url_for(:controller => 'home', :action => 'home')+"', '"+"Login Successful"+"');"}
      else
        format.js { render :js => "redirect('#{ url_for :controller => 'authenticator', :action => 'login'}', '"+"Login Unsuccessful"+"');"}
      end
    end


  end

  def deauthenticate


    respond_to do |format|
      if session[:is_authenticated] == false;
        format.js { render :js => ""}
      else
        session.clear
        format.js { render :js => "redirect('#{ url_for :controller => 'authenticator', :action => 'login'}', '"+"Logout Successful"+"');"}
      end

    end
  end

  def deauthenticate_all_students
    settings = CyClickerSettings.first
    settings.studentsBlocked=true
    settings.save
    respond_to do |format|
      format.js { render :js => "redirect('#{ url_for :controller => 'home', :action => 'home'}', '"+"All Students Locked Out"+"');"}
    end
  end

  def reauthenticate_all_students
    settings = CyClickerSettings.first
    settings.studentsBlocked=false
    settings.save
    respond_to do |format|
      format.js { render :js => "redirect('#{ url_for :controller => 'home', :action => 'home'}', '"+"All Students have been reauthorized to use the system."+"');"}
    end
  end

  def blocked
      settings = CyClickerSettings.first
      blocked = settings.studentsBlocked
      render :json => (blocked and (session[:account].account_type == 'student'))
  end

end
