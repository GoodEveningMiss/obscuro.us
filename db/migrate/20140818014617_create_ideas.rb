class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :body
      t.date :due_date
      t.boolean :completion_status
      t.integer :votes

      t.timestamps
    end
  end
end
