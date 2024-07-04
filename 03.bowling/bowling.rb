#!/usr/bin/env ruby
require 'debug'
score = ARGV[0]
scores = score.split(',')
shots = []

scores.each_with_index do |s|
    if s == 'X'
        shots << 10
    else
        shots << s.to_i
    end
end


p shots

frames = []
i = 0
while i < shots.length
  if shots[i] == 10 
    frames << [10]
    i += 1
else
    frames << [shots[i], shots[i+1]]
    i += 2
  end
end

frames[-1].compact!

p frames
p frames[-1]


point = 0
frames[0..9].each_with_index do |frame, index|
  if frame[0] == 10 # ストライク
    if frames[index + 1][0]  && frames[index + 2][0]  && frames[index + 1][0]  == 10 # 連続連続ストライク
        point += frame[0]  + frames[index + 1][0]  + frames[index + 2][0] 
      elsif frames[index + 1][0]  && frames[index + 1][0]  == 10 # 連続ストライク
        point += frame[0]  + frames[index + 1][0] 
      elsif frames[index + 1] # 次のフレームがスペアまたは合計10未満
        point += frame[0]  + frames[index + 1].sum
      else
        point += frame.sum
      end
  elsif frame.sum == 10 # スペア
    if frames[index + 1]
      point += frame.sum + frames[index + 1][0]
    else
      point += frame.sum
    end
  else
    point += frame.sum
  end
end


puts point



