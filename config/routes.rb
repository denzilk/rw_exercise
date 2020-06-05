Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 'likes' api
  get '/api/:user_id/likes/popular_posts', to: 'api/likes#popular_posts'
  get '/api/:user_id/likes/biggest_fans', to: 'api/likes#biggest_fans'
  get '/api/:user_id/likes/popular_days', to: 'api/likes#popular_days'
  
end
