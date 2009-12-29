#!/usr/bin/env ruby
# Randname: a random word generator
# Thibault Jouan <tj@a13.fr>

libdir = File.join(File.expand_path(File.dirname(__FILE__)), './lib')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'randname'
r = Randname.new

puts r.name 8, true, 'ta'
