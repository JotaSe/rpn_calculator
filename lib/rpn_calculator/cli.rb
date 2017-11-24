require 'thor'
require 'rpn_calculator'

module RpnCalculator
  class CLI < Thor
    desc 'input', 'Input a value to the calculator'
    def input(*args)
      calculator = RpnCalculator::Calculator.new
      puts args.map { |val| calculator.perform(val) }.last
    end
  end
end
