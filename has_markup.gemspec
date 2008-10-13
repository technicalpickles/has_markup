Gem::Specification.new do |s|
  s.name = %q{has_markup}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols"]
  s.date = %q{2008-10-13}
  s.description = %q{Manage markup close to home... right in the model! Caching, validation, etc}
  s.email = %q{josh@technicalpickles.com}
  s.files = ["lib/has_markup", "lib/has_markup/active_record.rb", "lib/has_markup/markdown.rb", "lib/has_markup/shoulda.rb", "lib/has_markup/textile.rb", "lib/has_markup/version.rb", "lib/has_markup.rb", "test/database.yml", "test/debug.log", "test/post.rb", "test/post_test.rb", "test/schema.rb", "test/test.log", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/technicalpickles/has_markup}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Manage markup close to home... right in the model! Caching, validation, etc}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
