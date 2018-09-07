class ModifyAnswerChoices < ActiveRecord::Migration[5.1]
  def change
    remove_index :answer_choices, :text 
    add_index :answer_choices, :question_id
  end
end
