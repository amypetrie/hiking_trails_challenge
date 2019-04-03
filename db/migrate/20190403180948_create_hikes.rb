class CreateHikes < ActiveRecord::Migration[5.2]
  def up
    create_table :hikes do |t|
      t.string :name
      t.integer :vote_count
    end
  end

  def down
    drop_table :hikes
  end
end
