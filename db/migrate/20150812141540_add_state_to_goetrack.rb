class AddStateToGoetrack < ActiveRecord::Migration
  def up
    add_column :geotracks, :state, :string
  end

  def down
    remove_column :geotracks, :state, :string
  end
end
