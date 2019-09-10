class Image
      attr_accessor :image

          def initialize(image)
            @image = image
          end

              def output_image
                @image.each do |row|
                  puts row.join
              end

      end

                  def blur (distance = 1)
                    distance.times do
                      blur_coordinates
                    end
                  end
      

                      def blur_coordinates
                        blur_coordinates = [ ]
                          @image.each_with_index do |row, i|
                            row.each_with_index do |x, row_i|
                              blur_coordinates << [i, row_i] if x == 1
                        end
                      end


                          blur_coordinates.each do |coordinates|
                            @image[coordinates[0]][coordinates[1]+1]=1 if coordinates[1]+1 <= @image[coordinates[0]].length - 1
                            @image[coordinates[0]][coordinates[1]-1]=1 if coordinates[1]-1 >= 0
                            @image[coordinates[0]+1][coordinates[1]]=1 if coordinates[0]+1 <= @image.length - 1
                            @image[coordinates[0]-1][coordinates[1]]=1 if coordinates[0]-1 >= 0
                            end
                          end

end


image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.blur
image.output_image