module Annealing::Simul
  class Person < Struct.new(:answers)

    def mismatches(other)
      m = answers.zip(other.answers).select{|a,b| a != b}.length
      #puts self.answers.inspect
      #puts other.answers.inspect
      #puts m
      m
    end

    def similarity_color(other)
      m = mismatches(other)
      h = answers.length / 2.0
      d = 30 * (h - m).abs
      b = [0, (255-d)].max
      o = [d, 255].min
      if m < h
        [0, o, b]
      else
        [o, 0, b]
      end
    end

    def sum
      answers.inject(0){|s,i| s + i }
    end
  end
end
