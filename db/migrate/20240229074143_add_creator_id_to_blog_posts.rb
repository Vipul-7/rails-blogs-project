class AddCreatorIdToBlogPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :creator_id, :integer
    add_index :blog_posts, :creator_id
    add_foreign_key :blog_posts, :users, column: :creator_id
  end
end