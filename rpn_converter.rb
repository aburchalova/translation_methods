require './string_extension'

class RpnConverter
  attr_accessor :expression
  attr_accessor :operator_stack
  attr_accessor :postfix_expression

  def initialize(expression)
    @operator_stack = []
    @postfix_expression = []
    @expression = expression
  end

  def to_postfix
    tokens = expression.split #splits by spaces
    tokens.each do |token|
      case
      when token.left_parenthesis?
        process_left_parenthesis(token)
      when token.right_parenthesis?
        process_right_parenthesis(token)
      when token.operator?
        process_operator(token)
      else
        process_other(token)
      end
    end

    pop_leftovers
    postfix_expression.join(" ")
  end

  def self.to_postfix(expression)
    self.new(expression).to_postfix
  end

  def process_operator(token)
    operator_stack.reverse_each do |operator|
      operator.greater_precedence?(token) ? pop_operator : break
    end
    operator_stack << token
  end

  def pop_operator
    postfix_expression << operator_stack.pop
  end

  def process_left_parenthesis(token)
    operator_stack << token
  end

  def process_right_parenthesis(token)
    postfix_expression << operator_stack.pop until operator_stack.last.left_parenthesis?
    operator_stack.pop
  end

  def process_other(token)
    postfix_expression << token
  end

  def pop_leftovers
    postfix_expression << operator_stack.pop until operator_stack.empty?
  end
end
