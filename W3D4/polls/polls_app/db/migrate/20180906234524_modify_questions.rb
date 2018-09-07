class ModifyQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_index :questions, [:text, :poll_id]
    add_index :questions, :poll_id
  end
end
