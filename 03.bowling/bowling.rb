#!/usr/bin/env ruby

# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = scores.map { |s| s == 'X' ? 10 : s.to_i }

frames = []
i = 0
while i < shots.length
  length = shots[i] == 10 ? 1 : 2
  frames << shots[i, length]
  i += length
end

point = 0
frames[0..9].each_with_index do |frame, index|
  next_frame = frames[index + 1]
  after_next_frame = frames[index + 2]
  point += frame.sum +
           if frame[0] == 10
             next_frame[0] + (next_frame[0] == 10 ? after_next_frame[0] || 0 : next_frame[1] || 0)
           elsif frame.sum == 10
             next_frame[0] || 0
           else
             0
           end
end

puts point
