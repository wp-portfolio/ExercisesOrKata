module Fibonacci
  
  def self.recursive_fib(number)#0
    number <= 1 ? number : recursive_fib(number - 1) + recursive_fib(number - 2) #using ternary conditional op again, like in luhn
                                                                                 # if number <= 1, self.recursive_fib(number) = number
                                                                                 #else recursive_fib(number - 1) + recursive_fib(number - 2)
  end


  def self.iterative_fib(number) #ex number = 3
    firstNum = 0 #1 fib(0) = 0 
    secondNum = 1 #1 fib(1) = 1
    number.times do #1
      thirdNum = (firstNum + secondNum) #p1
      #p1 - thirdNum = 0 + 1
      #p2 - thirdNum = 1 + 1
      #p3 - thirdNum = 1 + 2
      firstNum = secondNum 
      #p1 - firstNum = 1
      #p2 - firstNum = 1
      #p3 - firstNum = 2
      secondNum = thirdNum 
      #p1 - secondNum = 1
      #p2 - secondNum = 2
      #p3 - secondNum = 3
    end
    firstNum
    #p1 firstNum = 0
    #p2 firstNum = 1
    #p3 firstNum = 2
  end


end

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { Fibonacci.recursive_fib(num) }
  x.report("iterative_fib")  { Fibonacci.iterative_fib(num)  }
end