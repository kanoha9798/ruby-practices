#!/usr/bin/env ruby

require 'optparse'
require 'date'

opt = OptionParser.new

params = {}

opt.on('-y year'){|year| params[:y] = year.to_i}
opt.on('-m month'){|month| params[:m] = month.to_i}

opt.parse!(ARGV)

year = params[:y] || Date.today.year
month = params[:m] || Date.today.month

class Date
    def beginning_of_month
      Date.new(year, month, 1)
    end
  
    def end_of_month
      (self >> 1).beginning_of_month - 1
    end
  end
  
  start_date = Date.new(year, month, 1).beginning_of_month
  end_date = start_date.end_of_month 
  
  puts "#{start_date.year}年#{start_date.month}月".center(20)
  puts "日 月 火 水 木 金 土".center(10)
  first_wday = start_date.wday
  print "   " * first_wday
  
  (start_date..end_date).each do |date|
    date_str = date.day.to_s
    print date_str.ljust(3, ' ')  
    if date.saturday?
      puts
    end
  end
