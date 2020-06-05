class Api::LikesController < ApplicationController
    # btw, the instructions say there should be 4 routes, i guess one went missing :)

    def popular_posts
        json_data = {}

        render :json => json_data
    end

    def biggest_fans
        json_data = {}
        
        render :json => json_data        
    end

    def popular_days
        json_data = {}
        
        render :json => json_data        
    end

end
