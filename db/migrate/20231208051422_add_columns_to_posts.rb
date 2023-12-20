class AddColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :genre, :string, null: false
    add_column :posts, :start_time, :datetime, null: false
    add_column :posts, :location, :string, null: false
  end
end
