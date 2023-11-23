class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :image
      t.text :caption
      t.integer :comments_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
