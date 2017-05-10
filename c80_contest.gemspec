# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'c80_contest/version'

Gem::Specification.new do |spec|
  spec.name          = 'c80_contest'
  spec.version       = C80Contest::VERSION
  spec.authors       = ['C80609A']
  spec.email         = ['c080609a@gmail.com']

  spec.summary       = 'Конкурс'
  spec.description   = 'Пришли чек и участвуй в розыгрыше 500 литров бензина'
  spec.homepage      = 'https://github.com/c80609a/c80_contest'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.0'
  spec.add_development_dependency 'rails', '~> 4.0'
  spec.add_development_dependency 'activeadmin', '~> 1.0'
  spec.add_development_dependency 'mysql2', '~> 0.3.18'
  spec.add_development_dependency 'dotenv-rails', '~> 2.2.1'
  spec.add_development_dependency 'shoulda-matchers', '~> 3.1'
  spec.add_development_dependency 'execjs', '~> 2.7.0'
  spec.add_development_dependency 'therubyracer', '~> 0.12.3'
  spec.add_development_dependency 'mini_magick', '~> 4.3.3'
  spec.add_development_dependency 'carrierwave', '~> 0.10.0'
end
