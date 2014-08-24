class AddListToIdea < ActiveRecord::Migration
  def change
    add_reference :ideas, :list, index: true
  end
end
