require 'rubygems'
require 'rake'
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "jeg"
    s.executables = "jeg"
    s.summary = "jeg a json grep"
    s.email = "rff.rff@gmail.com"
    s.homepage = "http://github.com/riffraff/jeg"
    s.description = "A command line tool to slice and dice JSON-encoded data as simple a structured text format"
    s.authors = ["Gabriele Renzi"]
    s.files =  FileList["**/*"]
    s.add_dependency 'riffraff_jsonpath'
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end


