

class Enrollment < ApplicationRecord
  
  
  
  belongs_to :student,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: 'User'
  
  belongs_to :course,
  primary_key: :id, 
  foreign_key: :course_id, 
  class_name: 'Course'

  # add_index :enrollments, :course_id 
  # add_index :enrollments, :student_id
  
end
