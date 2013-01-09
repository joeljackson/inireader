Gem::Specification.new do |s|
  s.name        = "inireader"
  s.version     = "0.0.1"
  s.author      = "Joel Jackson"
  s.email       = "jackson.joel@gmail.com"
  s.homepage    = "http://github.com/joeljackson/inireader"
  s.summary     = "Simple ruby ini reader"

  s.files        = `git ls-files`.split($/)
  s.require_path = "lib"
end