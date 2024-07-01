#!/usr/bin/env ruby

require 'optparse'
require 'date'

opt = OptionParser.new

params = {}

opt.on('-y year') { |year| params[:y] = year.to_i }
opt.on('-m month') { |month| params[:m] = month.to_i }

opt.parse!(ARGV)

today = Date.today
year = params[:y] || today.year
month = params[:m] || today.month

start_date = Date.new(year, month, 1)
end_date = Date.new(year, month, -1) 
  
puts "#{year}年#{month}月".center(20)
puts "日 月 火 水 木 金 土"
first_wday = start_date.wday
print "   " * first_wday
  
(start_date..end_date).each do |date|
  date_str = date.day.to_s.rjust(2,' ')
  print date_str + ' '

  if date.saturday?
     puts
  end
end

puts
