require 'rpn_calculator/version'
require 'rpn_calculator/memory'

module RpnCalculator
  OPERATORS = %w[+ - * /].freeze
  INVALID_ERROR = 'Please enter only numbers or this operators : + - * /'.freeze
  EMPTY_STACK_ERROR = 'There are no numbers to calculate'.freeze

  # Class that will handle and operate the calculation functions
  class Calculator
    def initialize
      @memory = RpnCalculator::Memory.new
    end

    # public method that will handle the calculator's input
    def perform(input)
      return INVALID_ERROR unless valid?(input)
      # update @memory.tokens with the new input
      @memory.tokens.push input

      # evaluate and take action by the input
      result = evaluate
      @memory.save
      result
    end

    private

    # Check if the inputs is an operator or a number
    def valid?(input)
      OPERATORS.include?(input) || numeric?(input)
    end

    def evaluate
      @memory.tokens.each do |token|
        # if is a number then add to the stack
        if numeric?(token)
          @memory.stack.push(token.to_f)
        else # if is a operator calculate
          return EMPTY_STACK_ERROR if @memory.stack.empty?
          calculate(token)
        end
      end
      # Return the last value or the result if the operation is completed
      @memory.stack.last
    end

    # Calculate the last 2 numbers in the stack
    def calculate(operator)
      operands = @memory.stack.pop(2)
      @memory.stack.push(operands.inject(operator))
    end

    # Check if the input is a numeric value
    def numeric?(input)
      !Float(input).nil?
    rescue
      false
    end
  end
end
