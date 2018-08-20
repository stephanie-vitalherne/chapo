class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image_url
      t.string :username
      t.text :content
      t.datetime :post_date
      t.boolean :public
    end
  end
end
