class Api::LikesController < ApplicationController
    # btw, the instructions say there should be 4 routes, i guess one went missing :)

    def popular_posts
        user_id = params[:user_id] || User.find_by_name('denzil').id
        sql = %{
            select l.post_id, count(*) as popularity 
            from likes l 
            join posts p 
            on l.post_id = p.id 
            where p.user_id = #{user_id} 
            group by l.post_id 
            order by popularity desc;
        }.gsub(/\s+/, " ").strip

        records = ActiveRecord::Base.connection.execute(sql)

        render :json => {
            sql: sql,
            records: records,
        }.to_json   
    end

    def biggest_fans
        user_id = params[:user_id]  || User.find_by_name('denzil').id        
        sql = %{
            select l.user_id, count(*) as popularity 
            from likes l 
            join posts p 
            on l.post_id = p.id 
            where p.user_id = #{user_id} 
            group by l.user_id
            order by popularity desc;
        }.gsub(/\s+/, " ").strip

        records = ActiveRecord::Base.connection.execute(sql)

        render :json => {
            sql: sql,
            records: records,
        }.to_json 
    end

    def popular_days
        user_id = params[:user_id]  || User.find_by_name('denzil').id        
        sql = "agg, ran out of time"

        records = ActiveRecord::Base.connection.execute(sql)

        render :json => records.to_json
    end

end
