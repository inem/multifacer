require_relative 'lib/face'
require_relative 'lib/face_generator'

generator = FaceGenerator.from_yaml('face_parts.yml')

def play(collection)
  system "clear"
  puts collection.sample
  sleep 0.5
end

20.times { play(generator) }

puts
puts