class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_url
      t.string :image_title
      t.string :image_location
      t.integer :click_count

      t.timestamps null: false
    end
  end
end
