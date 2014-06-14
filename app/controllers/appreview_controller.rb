class AppreviewController < ApplicationController
    # for reviewer
    def index
        # st = params[]
        appid = params[:appid]
        rs = App.find_by_sql("select * from apps where st>=0 and st != 100")
        @list = rs if rs
    end
       
       
       
       def list
           st = params[:st]
           appid = params[:appid]
           rs = App.find_by_sql("select * from apps where st>=0 and st != 100")
           @list = rs if rs
       end
       
       def approve
           appid = params[:appid]
           rs = App.find_by_sql("select * from apps where appid='#{appid}'")
           if rs && rs.size >0
               rs[0][:st] = 100
               rs[0].save!
           else
               error("No such App")
               return
           end
           
           data = http_post($SETTINGS[:appstore_publish_app_url], rs[0].attributes)
           p "--->#{data}"
           ret = JSON.parse(data)
           if ret['error']
               error(ret['error'])
               return
           end
           
           success
       end
end
