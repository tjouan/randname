#!/usr/bin/env ruby

def String.randname(size=8)
  s = ''
  size.times { s << (i = Kernel.rand(26); i += 97).chr }
  s
end

while true do
  rand = String.randname(ARGV[0] ? ARGV[0].to_i : 4)
  if ARGV[1] and ARGV[2]
    puts "#{ARGV[1]}#{rand}#{ARGV[2]}"
  else
    puts rand
  end
end
