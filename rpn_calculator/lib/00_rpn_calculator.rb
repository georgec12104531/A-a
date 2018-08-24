class RPNCalculator

  attr_accessor :stack

  OPERATORS = [:+, :-, :*, :/]

  def initialize
    @stack = []
  end

  def push(obj)
    @stack << obj
  end

  def plus
    perform_operator(:+)
  end

  def minus
    perform_operator(:-)
  end

  def times
    perform_operator(:*)
  end

  def divide
    perform_operator(:/)
  end

  def value
    @stack.last
  end

  def evaluate(str)
    stack_city = self.tokens(str)
    (0...stack_city.length).each do |i|
      self.push(stack_city[i]) if stack_city[i].is_a?(Integer)
      self.times if stack_city[i] == :*
      self.plus if stack_city[i] == :+
      self.minus if stack_city[i] == :-
      self.divide if stack_city[i] == :/
    end
    self.value
  end

  def tokens(string)
    split_string = string.split(" ")
    split_string.map do |el|
      operators?(el) ? el.to_sym : Integer(el)
    end

  end

  private
  def operators?(char)
    OPERATORS.include?(char.to_sym)
  end

  def perform_operator(op)

    raise "calculator is empty" if @stack.empty?

    right_op = @stack.pop
    left_op = @stack.pop

    case op
    when :+
      @stack << left_op + right_op
    when :-
      @stack << left_op - right_op
    when :/
      @stack << left_op.to_f / right_op.to_f
    when :*
      @stack << left_op * right_op
    end
    self
  end

end
