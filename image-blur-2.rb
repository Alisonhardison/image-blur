class Image  #build a class that allows for building a new image with specified data
  attr_accessor :rows # makes rows readable and writable to user

  def initialize(rows)
    @rows = rows      #is storing the data at variable rows
  end

  def output_image      # take each row join together output image
    @rows.each do |row|
      puts row.join
    end
  end

  def blur (distance = 1)     #find the pixels to blur in the array
    distance.times do         #then calls the blur coords method
      blur_coordinates
    end
  end


  def blur_coordinates
    blur_coordinates = [ ]      #creates an empty array
    @rows.each_with_index do |row, row_index|     #loop through each row and store the varible data
      row.each_with_index do |column, column_index| #loop through each column and store the variable data
        blur_coordinates << [row_index, column_index] if column == 1    #if column is 1 push blurcoords on row_index/column_index
      end
    end


    blur_coordinates.each do |coordinates|
      row_coord = coordinates[0]  #varible to hold sub[0]
      column_coord = coordinates[1]     #varible to hold[1]
      @rows[row_coord][column_coord+1]=1 unless column_coord >= @rows[row_coord].length - 1    #right  #column_coord is greater than or equal to row_coord length then -1
      @rows[row_coord][column_coord-1]=1 unless column_coord == 0                              #left
      @rows[row_coord+1][column_coord]=1 unless row_coord+1 >= @rows.length - 1                  #down #row_coord plus 1 is greater than the length of the row then -1
      @rows[row_coord-1][column_coord]=1 unless row_coord == 0                                 #up
      end
    end
                                                                                               #unless executes code if conditional is false

end


image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0], #[1,1]
[0, 0, 0, 1], #[2,3]
[0, 0, 1, 0]
])

image.blur              #blurred image
image.output_image      #original image

image2 = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 1, 0]
])

image2.blur(2)
image2.output_image
puts