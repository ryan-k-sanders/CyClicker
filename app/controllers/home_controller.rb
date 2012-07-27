class HomeController < ApplicationController
  def header
    @is_mobile = is_mobile

  end

  def home
    @is_mobile = is_mobile
    settings = CyClickerSettings.first
    blocked = settings.studentsBlocked
    if session[:is_authenticated]
      @blocked = (blocked and (session[:account].account_type == 'student'))
    else
      @blocked = false;
    end

  end
end
