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

    # vertical split of the main window
    left = FXVerticalFrame.new self,
      LAYOUT_SIDE_LEFT | LAYOUT_FILL_Y | PACK_UNIFORM_WIDTH
    right = FXVerticalFrame.new self,
      LAYOUT_SIDE_RIGHT | LAYOUT_FILL_X | LAYOUT_FILL_Y

    # Randname settings controls
    matrix = FXMatrix.new left, 2, MATRIX_BY_COLUMNS | LAYOUT_FILL_X

    @len = FXSpinner.new matrix, 2, nil
    @len.incrementByAmount 6
    FXLabel.new matrix, 'word length'

    @n = FXSpinner.new matrix, 2, nil
    @n.incrementByAmount 32
    FXLabel.new matrix, 'number of words'

    @altern = FXCheckButton.new left, 'alternate consonants and vowels', nil, 0,
     ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP

    FXHorizontalSeparator.new left,
      LAYOUT_SIDE_BOTTOM | LAYOUT_FILL_X | SEPARATOR_GROOVE

    button_gen = FXButton.new left, 'Generate!'
    button_gen.connect SEL_COMMAND do |sender, selector, data|
      if @altern.checked?
        @results.text = $r.name 8, true
      else
        @results.text = $r.name 8, false
      end
    end
    button_gen.tipText = 'Generate words based on your settings'

    # results ext area
    @results = FXText.new right, nil, 0,
      TEXT_READONLY | LAYOUT_FILL_X | LAYOUT_FILL_Y
  end

  def create
    super
    show PLACEMENT_SCREEN
  end
end

if __FILE__ == $0
  app = FXApp.new 'RNGui', 'A13'
  RNGuiWindow.new app
  app.create
  app.run
end
