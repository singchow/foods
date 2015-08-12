class CreateGeotracks < ActiveRecord::Migration
  def change
    create_table :geotracks do |t|
      t.string :ip
      t.string :county
      t.string :coordinate
      t.string :referral
      t.timestamps null: false
    end
  end
end
