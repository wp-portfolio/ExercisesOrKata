#StudyDoc has some of my thoughts, rest are sketches/workflow in notebook
class Image
  attr_accessor :image
  def initialize(dataSet)
    @image = dataSet
  end

  def output_image
    @image.each do |row| #do row method for each array
      puts row.join
    end
  end

  def blur(distance)
    num = distance.to_s.to_i # is this the best way?

    num.times do
      blurM = Marshal.load(Marshal.dump(@image)) #stackoverflow tip - creates deep copy to store in new spot in memmory instead of mutating both
        @image.each_with_index do |row, rI| #convert array to enum, assign each spot  rI = index (or y axis)
        row.each_with_index do |col, cI| #cI = index (or x axis)
          if blurM[rI][cI] == 1 #(if copied new array in memory x,y coordinate where element == 1)
            @image[rI + 1][cI] = 1 unless rI == @image.length-1 #down (see line 47 in study doc for reference)
            @image[rI - 1][cI] = 1 unless rI == 0  #up
            @image[rI][cI + 1] = 1 unless cI == @image[rI].length-1 #right (ci is the element in specified row. move to next element in row with + 1)
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
=begin
            Tricky part


general logic: 
1.find the "1"'s prior to transforming anything
2. move around using the indecies rI and cI (x/y coordinates rI moves along Y axis as you are choosing rows,
 cI moves along x axis as you are choosing elements in those rows)

 example image
   [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
  if blurM[rI][cI] == 1
  in this case, row 2, element 2 = 1, so visualize rI = 2 cI = 2 for movement logic blurM[2][2] == 1
 example1 of a transform passing condition
checking row 2, element 2
 @image[rI + 1][cI] = 1 unless rI == @image.length-1
 @image[2 + 1][2] = 1 unless rI == @image.length-1
 this moves us down to row 3, still in the y axis of element 2. 
 at x,y position 2,3, set that element =1 UNLESS 2 == @image.lenth-1
 so why is that the condition?
 image.length = 4 (number of rows in the master array)
 leaving us with 
 2 == 3. we failed the unless, great! change that 2,3 to = 1

 example of a transform failing the condition
 row 3 element 1 = 0
 @image[3 + 1][1] = 1 unless 3 == @image.length-1
at row 4 element 1 set = 1 UNLESS 3 == @image.length-1
3 == 3 so we dont set it to 1, leave it at 0 instead


some extra movement thought process.
quick note if at rI 4, ci 5 the element == 1: move up/down/left/right

todo: write a test class instead of editing the test image each time lol
=end