class ModifyPollsIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :polls, [:title, :author_id]
    add_index :polls, :title 
    add_index :polls, :author_id
  end
end
