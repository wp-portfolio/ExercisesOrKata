#StudyDoc has more comments, rest are sketches/workflow in notebook
class Image
  attr_accessor :image
  def initialize(dataSet)
    @image = dataSet
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur(distance)
    num = distance.to_s.to_i

    num.times do
      blurM = Marshal.load(Marshal.dump(@image)) #stackoverflow tip
        @image.each_with_index do |row, rI| #y axis
        row.each_with_index do |col, cI| #x axis
          if blurM[rI][cI] == 1
            @image[rI + 1][cI] = 1 unless rI == @image.length-1 #down (see line 47 in study doc for reference)
            @image[rI - 1][cI] = 1 unless rI == 0  #up
            @image[rI][cI + 1] = 1 unless cI == @image[rI].length-1 #right
            @image[rI][cI - 1] = 1 unless cI == 0 # left
          end
        end
      end
    end
  end            


end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
])
puts "Original Image"
image.output_image
image.blur(3)
puts "Blur'd Image"
image.output_image
