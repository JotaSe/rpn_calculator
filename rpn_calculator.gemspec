
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rpn_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = 'rpn_calculator'
  spec.version       = RpnCalculator::VERSION
  spec.authors       = ['jotase']
  spec.email         = ['jota.segovia@gmail.com']

  spec.summary       = 'CLI for a Reverse Polish Notation (RPN) calculator'
  spec.description   = ''
  spec.homepage      = 'https://github.com/JotaSe/rpn_calculator'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'thor'
end
