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


point = 0
frames[0..9].each_with_index do |frame, index|
    next_frame = frames[index + 1]|| [0, 0]
    next_next_frame = frames[index + 2]|| [0, 0]
  if frame[0] == 10 # ストライク
    if next_frame[0]  && next_next_frame[0]  && next_frame[0]  == 10 # 連続連続ストライク
        point += frame[0]  + next_frame[0]  + next_next_frame[0] 
      elsif next_frame[0]  && next_frame[0]  == 10 # 連続ストライク
        point += frame[0]  + next_frame[0] 
      elsif next_frame # 次のフレームがスペアまたは合計10未満
        point += frame[0]  + next_frame.sum
      else
        point += frame.sum
      end
  elsif frame.sum == 10 # スペア
    if next_frame
      point += frame.sum + next_frame[0]
    else
      point += frame.sum
    end
  else
    point += frame.sum
  end
end


puts point



