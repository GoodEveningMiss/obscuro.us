class RemoveVotesFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :votes
  end
end
