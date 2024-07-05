#!/usr/bin/env ruby

# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []

scores.each do |s|
  shots << if s == 'X'
             10
           else
             s.to_i
           end
end

frames = []
i = 0
while i < shots.length
  if shots[i] == 10
    frames << [10]
    i += 1
  else
    frames << [shots[i], shots[i + 1]]
    i += 2
  end
end

point = 0
frames[0..9].each_with_index do |frame, index|
  next_frame = frames[index + 1] || [0, 0] # 次のフレーム
  next_next_frame = frames[index + 2] || [0, 0] # 2つ次のフレーム

  point += if frame[0] == 10 # ストライク
             if next_frame[0] && next_next_frame[0] && next_frame[0] == 10 # 2連続ストライク
               frame[0] + next_frame[0] + next_next_frame[0]
             elsif next_frame[0] && next_frame[0] == 10 # 連続ストライク
               frame[0] + next_frame[0]
             elsif next_frame # ストライクの次がスペアまたは合計10未満
               frame[0] + next_frame.sum
             else
               frame.sum
             end
           elsif frame.sum == 10 # スペア
             if next_frame
               frame.sum + next_frame[0]
             else
               frame.sum
             end
           else
             frame.sum
           end
end

puts point
