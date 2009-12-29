#!/usr/bin/env ruby
# Randname: a random word generator
# Thibault Jouan <tj@a13.fr>

require 'optparse'

libdir = File.join(File.expand_path(File.dirname(__FILE__)), './lib')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

opt = {
  :count      =>  32,
  :length     =>  8,
  :alternate  =>  false,
  :start      =>  nil,
  :forbid     =>  ''
}
OptionParser.new do |o|
  o.banner = "Usage: #{$0} [options]"
  o.on '-c', '--count N', 'number of words to generate' do |c|
    opt[:count] = c.to_i
  end
  o.on '-l', '--length N', 'length of generated words' do |l|
    opt[:length] = l.to_i
  end
  o.on '-a', '--alternate', 'alternate consonants and vowels' do |a|
    opt[:alternate] = a
  end
  o.on '-s', '--start STRING', 'prepend a string to generated words' do |s|
    opt[:start] = s
  end
  o.on '-f', '--forbid STRING', 'string of chars to be excluded in generated words' do |f|
    opt[:forbid] = f
  end
end.parse!

require 'randname'
r = Randname.new

opt[:count].to_i.times do
  puts r.name opt[:length], opt[:alternate], opt[:start], opt[:forbid]
  #puts r.name opt[:length], opt[:alternate], opt[:start], opt[:forbid]
end
