# Randname: a random word generator
# Thibault Jouan <tj@a13.fr>

class Randname
  def initialize
    @c = 'bcdfghjklmnpqrstvwxz'
    @v = 'aeiouy'
  end

  def first s
    (s.split //).shift
  end

  def last s
    (s.split //).pop
  end

  def is_consonant? c
    @c.include? c
  end

  def is_vowel? c
    @v.include? c
  end

  def letter
    (Kernel.rand(26) + 97).chr
  end

  def name(len, altern = false)
    s = ''
    while s.length < len do
      n = letter
      if altern and s.length >= 1
        redo if is_consonant?(last(s))  and is_consonant? n
        redo if is_vowel?(last(s))      and is_vowel? n
      end
      s << n
    end
    s
  end
end
