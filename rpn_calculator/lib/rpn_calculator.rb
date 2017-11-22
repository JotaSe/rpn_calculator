require 'rpn_calculator/version'

module RpnCalculator
  OPERATORS = %w[+ - * /].freeze

  class Calculator
    def initialize
      @stack = []
      @elements = []
    end

    private

    def update(input)
      if numeric?(input)
        @stack += input.to_f!
      else
        @elements += input
      end
    end

    def numeric?(input)
      !Float(input).nil?
    rescue
      false
    end
  end
end
