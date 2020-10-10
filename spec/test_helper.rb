require 'simplecov'
require 'rspec/autorun'

SimpleCov.start do
  enable_coverage :branch
  add_filter '_spec.rb'
end 
