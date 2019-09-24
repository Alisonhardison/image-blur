class Image  #build a class that allows for building a new image with specified data
   
  def initialize(rows)
    @rows = rows      #is storing the data at variable rows
  end

  def output_image      # take each row join together output image
    @rows.each do |row|
      puts row.join
    end
  end

  def get_pixel
    pixel = [] #creates an empty array
    @rows.each_with_index do |row, row_index|     #loop through each row and store the varible data
      row.each_with_index do |column, column_index|
        if column == 1
          pixel << [row_index, column_index]      #if column is 1 push pixel on row_index/column_index
        end
      end
    end
    pixel
  end


  def blur(distance)       
    pixel = get_pixel

    @rows.each_with_index do |row, row_index|               
      row.each_with_index do |column, column_index|          
        pixel.each do |found_row_index, found_column_index|             #take found pixels from row and column
          if manhattan_distance(column_index, row_index, found_column_index, found_row_index) <= distance     
            @rows[row_index][column_index] = 1
          end
        end
      end
    end
  end
  
  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    # (x2 - x1).abs + (y2 - y1).abs     #.abs returns the absolute value of nums
    horizontal_distance + vertical_distance
  end
                                                                                               

end


image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])

# original image
image.blur(0)
image.output_image
puts
# blurred image
image.blur(1)
image.output_image
puts


image.blur(2)
image.output_image
puts

image.blur(3)
image.output_image
puts