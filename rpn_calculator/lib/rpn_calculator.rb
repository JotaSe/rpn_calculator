require 'rpn_calculator/version'

module RpnCalculator
  OPERATORS = %w[+ - * /].freeze
  ERROR_MESSAGE = "Please enter only numbers or this operators : #{OPERATORS}".freeze

  # Class that will handle and operate the calculation functions
  class Calculator
    def initialize
      @stack = []
      @tokens = []
    end

    # public method that will handle the calculator's input
    def perform(input)
      return ERROR_MESSAGE unless valid?(input)
      # update @tokens with the new input
      @tokens += input

      # evaluate and take action by the input
      evaluate

      # Return the last value or the result if the operation is completed
      @stack.last
    end

    private

    def valid?(input)
      OPERATORS.include?(input) || numeric?(input)
    end

    def evaluate
      @tokens.each do |token|
        # if is a number then add to the stack
        if numeric?(token)
          @stack.push(token.to_f)
        else # if is a operator calculate
          calculate(token)
        end
      end
    end

    # Calculate the last 2 numbers in the stack
    def calculate(operator)
      operands = @stack.pop(2)
      @stack.push(operands.inject(operator))
    end

    # Check if the input is a numeric value
    def numeric?(input)
      !Float(input).nil?
    rescue
      false
    end
  end
end
