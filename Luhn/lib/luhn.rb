module Luhn
  def self.is_valid?(number)
    if number.nil? || number == 0 # check if number is nil or == 0
      number = false #return false if it is nil or 0
    else
      number.to_s.reverse.chars.map.with_index do |item, indx| #map each char with index to NEW array-> inside "do" is luhn logic -> assign value to new_number, move to next item in number
        new_number = indx.odd? ? item.to_i * 2 : item.to_i #example with [8,3] -> 3.odd? -> 8.to_i * 2 -> new_number = 16
        new_number -= 9 if new_number > 9 #new_number = 16 - 9 = [7,3]
        new_number #number = [[4,0][0,1][5,2][8,3]] new_number = %[4 0 5 7]
      end.sum % 10 == 0
    end
  end
end

# Strategy
#0. take care of nil and 0 cases up front else->
#1. take number, reverse it, turn it to a string and then take each character in the string and map it with an index -> do following for each char
#2. if indx.odd? set new_number = item.to_i * 2 -> this is doubling every second number
#3. else new_number = item.to_i
#4. if new_number > 9 new_number -= 9 -> this is the same as adding the digits (ex 16: 1+6 == 16-9)
#5. collect the output of the luhn logic (line 7/8) into an array called new_number

 #else block dry run:
 # take number, 
 #1. convert to string, 
 #2. reverse 
 #3.  4194560385008504 -> 4058005830654914
 #3. chars (same as each char) 
 #4. map chained with_index |item, indx|
 #5a. original array reversed with index = [[4,0][0,1][5,2][8,3][0,4][0,5][5,6][8,7][3,8][0,9][6,10][5,11][4,12][9,13][1,14][4,15]]              
 #5. new_number = 0.odd? == false -> : 4.to_i \\\\ new_number = 4 [[4,0]]
 #5. new_number = 1.odd? == true -> 0*2.to_i \\\ new_number = 0 [[4,0][0,1]]
 # new_number = 2.odd? == false -> 5.to_i \\\ new_number = 5 new_number = [[4,0][0,1][5,2]]
 # new_number = 3.odd? == true -> 8*2.to_i \\\ new_number = 16  \\ new_number-=9 if new_number >9 \\ new_number = 7 [[4,0][0,1][5,2][7,3]] etc etc
 # new_number = 4.odd \\ new_number = 0
 # new_number = 5.odd \\ new_number = 0
 # new_number = 6.odd \\ new_number = 5
 # new_number = 7.odd \\ new_number = 8 * 2 = 16 -= 9 = 7
 # new_number = 8.odd \\ new_number = 3
 # new_number = 9.odd \\ new_number = 0
 # new_number = 10.odd \\ new_number = 6
 # new_number = 11.odd \\ new_number = 5 * 2 = 10 -= 9 = 1
 # new_number = 12.odd \\ new_number = 4
 # new _number = 13.odd \\ new_number = 9 * 2 = 18 -= 9 = 9
 # new_number = 14.odd \\ new_number = 1
 # new number = 15.odd \\ new_number = 8

 #new_number = %[4 0 5 7 0 0 5 7 3 0 6 1 4 9 1 8]
 #end.sum = 60
 # end % 10 == 0 
 #true!





  

        
        
                  
              