require 'spec_helper'
require 'fileutils'

RSpec.describe RpnCalculator do
  before :each do
    RpnCalculator::Memory.new.clear
    @calculator = RpnCalculator::Calculator.new
  end

  it 'has a version number' do
    expect(RpnCalculator::VERSION).not_to be nil
  end

  it 'return the number input as float' do
    input = 1
    expect(@calculator.perform(input)).to eq(input.to_f)
  end

  it 'calculate the 2 last number if a operator is given' do
    @calculator.perform(2)
    @calculator.perform(2)
    @calculator.perform(2)

    expect(@calculator.perform('+')).to eq(4.0)
  end

  it 'return a error message if the input is not a operand or operator' do
    expect(@calculator.perform('foo')).to eq(RpnCalculator::INVALID_ERROR)
  end

  it 'return a error message if a operator is given with no number in stack' do
    expect(@calculator.perform('+')).to eq(RpnCalculator::EMPTY_STACK_ERROR)
  end

  def input_values(operation)
    operation.split(' ').map { |val| @calculator.perform(val) }.last
  end

  def perform(operation, expected_result)
    result = input_values(operation)
    expect(result).to eq(expected_result)
    RpnCalculator::Memory.new.clear
  end

  it 'return a result if a valid operation is given' do
    perform('5 8 +', 13.0)
    perform('5 8 + 13 -', 0.0)
    perform('-3 -2 * 5 +', 11.0)
    perform('5 9 1 - /', 0.625)
    perform('5 8 +', 13.0)
  end

  it 'loads in memory the tokens and stack when a memory is initialized' do
    input_values('-3 -2 * 5 +')
    @memory = RpnCalculator::Memory.new
    expect(@memory.tokens.any?).not_to be(false)
    expect(@memory.stack.any?).not_to be(false)
  end

  it 'saves in memory the inputs as token for each perform' do
    input_values('2 3 *')
    @memory = RpnCalculator::Memory.new
    expect(@memory.tokens).to eq(['2', '3', '*'])
  end

  it 'it delete the memory when clear method is invoked' do
    input_values('5 9 1 - /')
    @memory = RpnCalculator::Memory.new
    expect(@memory.exists?).to be(true)
    @memory.clear
    expect(@memory.exists?).to be(false)
  end
end
