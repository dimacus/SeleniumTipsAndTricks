require 'rubygems'
require 'parallel'

tests_to_run_in_parallel = 3
tests_to_execute = ["support/test1.rb", "support/test2.rb", "support/test3.rb"]



Parallel.map(tests_to_execute, :in_threads => tests_to_run_in_parallel) do |test_file|
  puts "Starting test #{test_file}"
  `ruby #{test_file}`
end