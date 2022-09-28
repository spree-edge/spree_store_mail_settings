# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_store_mail_settings/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_store_mail_settings'
  s.version     = SpreeStoreMailSettings.version
  s.summary     = 'Add extension to add email settings'
  s.description = 'store specific email settings'
  s.required_ruby_version = '>= 2.5'

  s.author    = 'Vishal Garg'
  s.email     = 'vishal@bluebash.co'
  s.homepage  = 'https://github.com/your-github-handle/spree_store_mail_settings'
  s.license = 'BSD-3-Clause'

  s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree', '>= 4.4.0'
  s.add_dependency 'spree_extension'

  s.add_development_dependency 'spree_dev_tools'
  s.add_development_dependency 'deface'
end
