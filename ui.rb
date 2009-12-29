#!/usr/bin/env ruby
# Randname: a random word generator
# Thibault Jouan <tj@a13.fr>

require 'rubygems'
require 'fox16'

libdir = File.join(File.expand_path(File.dirname(__FILE__)), './lib')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'randname'
$r = Randname.new

include Fox

class RNGuiWindow < FXMainWindow
  def initialize app
    super app,
      "Randname: a random word generator, GUI version",
      :opts => DECOR_ALL

    FXToolTip.new self.getApp

    button_gen = FXButton.new self, 'Generate!'
    button_gen.connect SEL_COMMAND do |sender, selector, data|
      puts $r.name 8, true
    end
    button_gen.tipText = 'Generate words based on your settings'
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

if __FILE__ == $0
  app = FXApp.new('RNGui', 'A13')
  RNGuiWindow.new(app)
  app.create
  app.run
end
