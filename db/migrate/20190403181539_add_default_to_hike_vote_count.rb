class AddDefaultToHikeVoteCount < ActiveRecord::Migration[5.2]
  def up
    change_column :hikes, :vote_count, :integer, default: 0
  end

  def down
    change_column :hikes, :vote_count, :integer, default: nil
  end
end
