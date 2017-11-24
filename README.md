# RpnCalculator

https://en.wikipedia.org/wiki/Reverse_Polish_notation

RPN Calculator CLI tool

## Installation

Clone this project `git git@github.com:JotaSe/rpn_calculator.git && cd rpn_calculator`

And then execute:

    $ bundle

## Usage
CLI: type in the terminal `bin/calculator` to see options: 

```
Commands:
  calculator clear           # Clear the calculators memory
  calculator help [COMMAND]  # Describe available commands or one specific command
  calculator input           # Input a value to the calculator
  calculator operation       # Input a operation to the calculator
```

### CLI Examples

**input**
```
$ bin/calculator input 2
> 2.0
$ bin/calculator input 2
> 2.0
$ bin/calculator input +
> 4.0
```

**operation**
```
$ bin/calculator input 2 2 +
> 4.0
```

**clear**
```
$ bin/calculator clear
> Memory cleared successfully
```

### Gem example


**input**
``` ruby
    calculator = RpnCalculator::Calculator.new
    calculator.perform(2)
    calculator.perform(2)
    calculator.perform('+')
    # 4.0
```

**operation**
``` ruby
    calculator = RpnCalculator::Calculator.new
    operation = '2 2 +'.split(' ')
    result = operation.map { |value|  calculator.perform(value) }.last
    # 4.0
```

**clear**
``` ruby
      memory = RpnCalculator::Memory.new
      memory.clear
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jotase/rpn_calculator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

