# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inireader/version'

Gem::Specification.new do |s|
  s.name        = "inireader"
  s.version     = IniReader::VERSION
  s.author      = "Joel Jackson"
  s.email       = "jackson.joel@gmail.com"
  s.homepage    = "http://github.com/joeljackson/inireader"
  s.summary     = "Simple ruby ini reader"

  s.files        = `git ls-files`.split($/)
  s.require_path = "lib"

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'autotest'
  s.add_development_dependency 'autotest-fsevent'
  s.add_development_dependency 'autotest-growl'
end