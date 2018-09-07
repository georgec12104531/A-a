class Question < ApplicationRecord 
  
  
  #MIGHT BE has_one if an answer choice is a list of answers for one question!!!
  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice' 
  
  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'
    
end