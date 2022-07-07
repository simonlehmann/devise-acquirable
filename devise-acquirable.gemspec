# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/acquirable/version'

Gem::Specification.new do |spec|
  spec.name          = 'devise-acquirable'
  spec.version       = Devise::Acquirable::VERSION
  spec.authors       = ['Simon Lehmann']
  spec.email         = ['slehmann36@gmail.com']
  spec.description   = 'Easily capture and store marketing data during Devise user onboarding.'
  spec.summary       = 'Easily capture and store marketing data during Devise user onboarding.'
  spec.homepage      = 'https://github.com/simonlehmann/devise-acquirable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'devise', '~> 4.0', '>= 4.0.0'
end
