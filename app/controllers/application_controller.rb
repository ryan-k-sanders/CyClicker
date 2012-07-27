class ApplicationController < ActionController::Base
  #protect_from_forgery

  layout Proc.new { |controller| controller.request.xhr? ? false : detect_browser }

  before_filter :is_authenticated , :except => [:login, :authenticate, :home, :header, :deauthenticate, :blocked]




  #layout :detect_browser




  private

  MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    MOBILE_BROWSERS.each do |m|
      if agent.match(m)
        return "mobile"
      end
      return "application"
    end
  end

  def is_mobile
      agent = request.headers["HTTP_USER_AGENT"].downcase
      yes = false;
      MOBILE_BROWSERS.each do |m|
        if agent.match(m)
          yes = true;
        end
      end
      if yes == true
        return true;
      end
      return false;
  end




    def is_authenticated
      if session[:is_authenticated] != true
        redirect_to :root
      end
    end

end
