# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easybill/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'easybill-api'
  spec.version       = Easybill::Api::VERSION
  spec.authors       = ['Patrick Nüser']
  spec.email         = ['mail@patrick-nueser.de']

  spec.summary       = 'Wrapper for the easybill REST api'
  spec.homepage      = 'https://www.github.com/schnika/easybill'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 3.3'

  spec.add_runtime_dependency 'httparty', '>= 0.16.3', '< 0.24.0'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
