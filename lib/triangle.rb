class Triangle

    attr_accessor :side1, :side2, :side3

    def initialize(side1, side2, side3)
        @side1 = side1
        @side2 = side2
        @side3 = side3
    end
  # def kind
  #   raise TriangleError if invalid_triangle?
  #   return :equilateral if @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 == @side2 && @side2 == @side3 && @side1 + @side2 > @side3 && @side2 + @side3 > @side1 
  #   return :isosceles if @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 == @side2 || @side2 == @side3 || @side1 == @side3 
  #   return :scalene
  # end

  def kind
    if invalid_triangle?
      raise TriangleError
    elsif @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 == @side2 && @side2 == @side3 && @side1 + @side2 > @side3 && @side2 + @side3 > @side1 
      return :equilateral 
    elsif @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 == @side2 || @side2 == @side3 || @side1 == @side3 
      return :isosceles
    elsif @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 != @side2 && @side2 != @side3 && @side1 != @side3 
      return :scalene
    end
  end

  private

  def invalid_triangle?
    sides = [side1, side2, side3]
    sides.any? { |side| side <= 0 } || sides.sort[0] + sides.sort[1] <= sides.sort[2]
  end

    class TriangleError < StandardError
      puts "Invalid triangle"
    end
end
