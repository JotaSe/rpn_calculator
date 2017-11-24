require 'thor'
require_relative '../rpn_calculator'
require_relative 'memory'

module RpnCalculator
  class CLI < Thor
    desc 'operation', 'Input a operation to the calculator'
    def operation(*args)
      calculator = RpnCalculator::Calculator.new
      puts args.map { |val| calculator.perform(val) }.last
    end

    desc 'input', 'Input a value to the calculator'
    def input(*args)
      return puts('You should add one value only') if args.size > 1
      calculator = RpnCalculator::Calculator.new
      puts calculator.perform(args.first)
    end

    desc 'clear', 'Clear the calculators memory'
    def clear
      memory = RpnCalculator::Memory.new
      memory.clear
      puts 'Memory cleared successfully'
    end
  end
end
