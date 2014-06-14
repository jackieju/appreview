class AppController < ApplicationController
    
    def index
        appid=params[:id]
        
        
    end
    
    def show
        
    end
    
    def list
        @list = App.find_by_sql("select * from apps where uid=#{@user.id}")
        
    end
    
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
        ver = params[:ver]
        
        p params.inspect
        if appid == nil
              error("Invalid app")
                return
            end
        
        data = http_post($SETTINGS[:appstore_query_app_url], {:appid=>appid})
        p "--->#{data}"
        ret = JSON.parse(data)
        if ret['error']
            error(ret['error'])
            return
        end
        
        App.new({
            :appid=>appid,
            :name=>name,
            :desc=>desc,
            :uid=>@user.id,
            :ver=>ver,
            :st=>0,
            :type=>apptype,
        }).save!
      
    end
    
    # list all app of developer
    # def listuserapp
    #     @apps = App.find_by_sql("select * from apps where uid=#{@user.id}")
    #     
    # end
    
    # abandon the review
    def abandon
    end
    
    # delete a published app will delete it on app store
    def delapp
        
    end
    
   
end
