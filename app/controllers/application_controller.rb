# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'ruby_utility.rb'
require 'settings.rb'
require 'json'

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :before_action
 
    def before_action
        @SETTINGS = $SETTINGS
        @user = User.new
    end
  def error(msg, data=nil)
       ret = {
          "error"=>msg
      }
      ret = ret.merge(data) if data
      render :text=>ret.to_json
      # render :text=>"{\"error\":\"#{msg}\"}"
  end
  def success(msg="OK", data=nil)
      ret = {
          "OK"=>msg
      }
      ret = ret.merge(data) if data
      render :text=>ret.to_json
      
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
