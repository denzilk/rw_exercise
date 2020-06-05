namespace :data do
  desc "loads friendface.csv into database"
  task ingest: :environment do
    require 'csv'
    file_location = 'friendface.csv'

    my_user = User.find_or_create_by(
      name: 'denzil'
    )

    csv = CSV.foreach(file_location, headers: true) do |row|       
      post_id = row['post-id']
      user_name = row['user']
      like_date = DateTime.parse(row['date'])

      Post.find_or_create_by(
        id: post_id,
        user_id: my_user.id,
        content: "Aloha! this is post #{post_id} by user #{my_user.name}"
      )

      user = User.find_or_create_by(
        name: user_name
      )

      Like.find_or_create_by(
        user_id: user.id,
        post_id: post_id,
        created_on: like_date
      )
    end



  end

end
