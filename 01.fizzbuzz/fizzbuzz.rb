#!/usr/bin/env ruby

(1..20).each do |number|
  case 
  when number % 3 == 0 && number % 5 == 0
    puts "fizzbuzz"
  when number % 3 == 0
    puts "fizz"
  when number % 5 == 0
    puts "buzz"
  else
    puts number
  end
  end

#1回目の提出
