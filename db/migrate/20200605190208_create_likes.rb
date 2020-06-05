class CreateLikes < ActiveRecord::Migration[5.2]
  def change    
    create_table :users do |t|
      t.string :name      
      t.timestamps
    end

    create_table :posts do |t|
      t.references :user, index: true
      t.text :content      
      t.timestamps
    end

    create_table :likes do |t|
      t.references :user, index: true
      t.references :post, index: true
      t.datetime :created_on
      t.timestamps
    end
  end
end
