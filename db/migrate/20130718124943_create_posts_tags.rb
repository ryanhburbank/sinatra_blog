class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.belongs_to  :tag
      t.belongs_to  :post
      t.integer     :counter, :default => 0
      t.timestamps
    end
  end
end
