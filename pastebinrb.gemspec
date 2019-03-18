lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pastebinrb/version'

Gem::Specification.new do |spec|
  spec.name          = "pastebinrb"
  spec.version       = Pastebinrb::VERSION
  spec.authors       = ['Maxime Palanchini']
  spec.email         = ['maxime.palanchini@gmail.com']

  spec.summary       = 'Send Pastebin with Ruby'
  spec.description   = ''
  spec.homepage      = 'https://github.com/Dakurei/pastebinrb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end
