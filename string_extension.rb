class String
  # PRECEDENCE = {
  #   0 => ['('],
  #   1 => ['+', '-'],
  #   2 => ['*', '/'],
  #   3 => ['^']
  # }

  UNARY_MINUS = '!'

  PRECEDENCE = {
    0 => ['('],
    1 => ['+'],
    2 => ['-'],
    4 => ['*'],
    3 => ['/'],
    5 => ['^']
  }

  OPERATORS_PRECEDENCE = {
    '(' => 0,
    '+' => 1,
    '-' => 2,
    '*' => 3,
    '/' => 4,
    '^' => 5,
    'sin' => 6,
    'cos' => 7,
    'tan' => 8,
    UNARY_MINUS => 9
  }

  OPERATORS = PRECEDENCE.values.flatten

  TRIG_MAPPING = {
    :sin => :s,
    :cos => :c,
    :tan => :t
  }



  def precedence_level
    # PRECEDENCE.find { |key,value| value.include?(self) }.to_a.first
    OPERATORS_PRECEDENCE[self]
  end

  def operator?
    OPERATORS.include?(self)
  end

  def greater_precedence?(operator)
    precedence_level > operator.precedence_level
  end

  def left_parenthesis?
    self == "("
  end

  def right_parenthesis?
    self == ")"
  end
end
