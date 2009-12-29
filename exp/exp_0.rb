#!/usr/bin/env ruby

def first s
  (s.split //).shift
end

def last s
  (s.split //).pop
end

class RandomName
  def initialize
    @c = 'bcdfghjklmnpqrstvwxz'
    @v = 'aeiouy'
    @name = first(@v)
  end

  def update
    if last(@name) == last(@c)
      @name += first(@v)
    elsif last(@name) == last(@v)
      @name += first(@c)
    else
      if @c.include?(last(@name))
        mod = (@c.split //)[@c.index(last(@name)) + 1]
      else
        mod = (@v.split //)[@v.index(last(@name)) + 1]
      end
      @name.sub! /.$/, ''
      @name += mod
    end
  end

  def to_s
    @name
  end
#  if v.include?((s.split //).pop)
#    s += c
end

rn = RandomName.new
while rn.update
  puts rn
end

=begin
exit unless ARGV.count >= 2

first = ARGV[0]
last  = ARGV[1]

puts "generating #{first} to #{last}"

len_total = 10
len_total.times do |l|
  puts l
  name = ''
  name = first
  l.times do |ll|
    puts ll
    if v.include?((name.split //).pop)
      c.each do |cc|
        puts name + cc + last
      end
    else
      v.each do |vv|
        puts name + vv + last
      end
    end
  end
end
=end
