class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :author_n      
      t.timestamps
    end

    create_table :users do |t|
      t.string :author_name      
      t.timestamps
    end

    create_table :likes do |t|
      t.references :post
      t.references :user      
      t.timestamps
    end
  end
end
