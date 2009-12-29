#!/usr/bin/env ruby
# Randname: a random word generator
# Thibault Jouan <tj@a13.fr>

require 'rubygems'
require 'fox16'

libdir = File.join(File.expand_path(File.dirname(__FILE__)), './lib')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'randname'
r = Randname.new

include Fox

app = FXApp.new

win = FXMainWindow.new app, 'Randname: a random word generator'

button_gen = FXButton.new win, 'Generate!'
button_gen.connect SEL_COMMAND do |sender, selector, data|
  puts r.name 8, true
end
button_gen.tipText = 'Generate words based on your settings'

FXToolTip.new app
app.create

win.show
app.run
