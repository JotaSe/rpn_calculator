require 'rpn_calculator/version'

module RpnCalculator
  OPERATORS = %w[+ - * /].freeze

  class Calculator
    def initialize
      @stack = []
      @elements = []
    end
  end
end
