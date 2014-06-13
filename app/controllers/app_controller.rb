class AppController < ApplicationController
    
    # submit by developer
    def presubmit
        appid = params[:appid]
        name = params[:name]
        desc = params[:desc]
        apptype = params[:apptype]
        
    end
    
    def submit
        appid = params[:app_id]
        name = params[:app_name]
        desc = params[:app_desc]
        apptype = params[:app_type]
        
        p params.inspect
        if appid == nil
              error("Invalid app")
                return
            end
        
        data = http_post(g_SETTINGS[:appstore_query_app_url], {:appid=>appid})
        p "--->#{data}"
        ret = JSON.parse(data)
        if ret['error']
            error(ret['error'])
            return
        end
      
    end
    
    # list all app of developer
    def listuserapp
        
    end
    
    def abandon
    end
    
    def delapp
    end
    
   
end
