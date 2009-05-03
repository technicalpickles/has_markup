# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{has_markup}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols"]
  s.date = %q{2009-05-03}
  s.description = %q{Manage markup close to home... right in the model! Caching, validation, etc}
  s.email = %q{josh@technicalpickles.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "VERSION.yml",
    "lib/has_markup.rb",
    "lib/has_markup/active_record.rb",
    "lib/has_markup/markdown.rb",
    "lib/has_markup/textile.rb",
    "lib/has_markup/version.rb",
    "shoulda_macros/has_markup.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/technicalpickles/has_markup}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Manage markup close to home... right in the model! Caching, validation, etc}
  s.test_files = [
    "test/post.rb",
    "test/post_test.rb",
    "test/schema.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
