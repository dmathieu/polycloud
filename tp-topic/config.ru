require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
require 'publisher'
run Publisher.new
