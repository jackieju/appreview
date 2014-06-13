class AppreviewController < ApplicationController
    # for reviewer
       def list
           st = params[]
           appid = params[:appid]
           rs = App.find_by_sql("select * from apps where st>0 and st != 5")
           @list = rs if rs
       end
end
