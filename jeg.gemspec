# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jeg}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gabriele Renzi"]
  s.date = %q{2010-02-03}
  s.default_executable = %q{jeg}
  s.description = %q{A command line tool to slice and dice JSON-encoded data as simple a structured text format}
  s.email = %q{rff.rff@gmail.com}
  s.executables = ["jeg"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.mkd"
  ]
  s.files = [
    "LICENSE",
     "README.mkd",
     "Rakefile",
     "VERSION",
     "bin/jeg",
     "jeg.gemspec",
     "test/docs.rb"
  ]
  s.homepage = %q{http://github.com/riffraff/jeg}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{jeg a json grep}
  s.test_files = [
    "test/docs.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<riffraff_jsonpath>, [">= 0"])
    else
      s.add_dependency(%q<riffraff_jsonpath>, [">= 0"])
    end
  else
    s.add_dependency(%q<riffraff_jsonpath>, [">= 0"])
  end
end

