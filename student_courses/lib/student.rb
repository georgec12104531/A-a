
class Student

  attr_accessor :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    full_name = "#{@first_name} #{@last_name}"
  end

  def enroll(new_course)
    return if @courses.include?(new_course)
    raise "Error" if has_conflict?(new_course)
    @courses << new_course
    new_course.students << self
  end

  def course_load
    load_hash = Hash.new(0)
    @courses.each do |enrolled_course|
      load_hash[enrolled_course.department] += enrolled_course.credits
    end
    load_hash
  end

  def has_conflict?(new_course)
    @courses.any? do |enrolled_course|
      new_course.conflicts_with?(enrolled_course)
    end
  end



end
