
class Employee

  attr_accessor :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end


class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    salary_sum = 0
    @employees.each do |employee|
      salary_sum += employee.salary
    end
    salary_sum * multiplier
  end


end
