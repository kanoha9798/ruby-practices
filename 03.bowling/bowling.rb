#!/usr/bin/env ruby

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
    if s == 'X'
        shots << 10
        shots << 0
    else
        shots << s.to_i
    end
end

frames = []
shots.each_slice(2) do |s|
    frames << s
end

tenth_frame = frames[9] # 10番目のフレーム
before_last_frame = frames[-2] # 最後から2番目のフレーム
last_frame = frames.last # 最後のフレーム

point = 0
frames.each_with_index do |frame, index|
  next_frame = frames[index + 1] # 次のフレーム
  next_next_frame = frames[index + 2] # 次の次のフレーム
  
  if index < 9
    if frame[0] == 10 # ストライク
      point += frame[0] + (next_frame ? next_frame.sum : 0)
    elsif frame.sum == 10 # スペア
      point += frame.sum + (next_frame ? next_frame[0] : 0)
    elsif next_frame && next_frame[0] == 10 && frames[index + 2] && frames[index + 2][0] == 10 # 連続ストライク
      point += frame.sum + next_frame[0] + frames[index + 2][0]
    else
      point += frame.sum
    end
  else
    if frame.sum == 10 && frames[index + 1] && frames[index + 1][0] # 10投目がスペア
      point += frame.sum + frames[index + 1][0]
    elsif frame[0] == 10 && frames[index + 1] && frames[index + 1][0] == 10 && frames[index + 2] && frames[index + 2][0] == 10 # 10投目がストライク、その後がストライク
      point += frame[0] + frames[index + 1][0] + frames[index + 2][0]
    else
      point += frame.sum
    end
  end
end


  

puts  point


