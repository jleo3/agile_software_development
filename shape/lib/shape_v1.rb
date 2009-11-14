module ShapeDrawer
  def draw
    puts "I'm drawing a shape"
  end
end

class Shape
  include ShapeDrawer
  attr_reader :measure, :draw_point

  def initialize(measure, draw_point)
    @measure = measure
    @draw_point = draw_point
  end

end

class Circle < Shape
  def draw
    puts "I'm drawing a circle with a radius of #{@measure} starting at #{@draw_point}"
  end
end

class Square < Shape
  def draw
    puts "I'm drawing a square with a side of #{@measure} starting at #{@draw_point}"
  end
end

def draw_all_shapes(list_of_shapes)
  list_of_shapes.each do |shape|
    shape.draw
  end
end

circle = Circle.new(5, 4)
square = Square.new(3,2)
list_of_shapes = [ circle, square ]
draw_all_shapes list_of_shapes
