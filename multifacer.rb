require_relative 'lib/face'
require_relative 'lib/face_generator'

collection = FaceGenerator.from_yaml('face_parts.yml')

parts = [:top, :eyes, :nose, :mouth]

def play(number, delay = 0.5)
  number.times do
    system "clear"
    yield
    sleep delay
  end
end

face = collection.sample

play(20) do
  puts face.modify(collection, parts.sample)
end
