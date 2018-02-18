class Face
  attr_reader :top, :eyes, :nose, :mouth
  
  def initialize(top, eyes, nose, mouth)
    @top   = top.strip
    @eyes  = eyes.strip
    @nose  = nose.strip
    @mouth = mouth.strip
  end

  def invalid?
    @top.empty? || @eyes.empty? || @nose.empty? || @mouth.empty?
  end

  def to_s
    "#{@top}\n#{@eyes}\n#{@nose}\n#{@mouth}"
  end
end

class FaceGenerator
  attr_reader :tops, :eyes, :noses, :mouths

  def initialize(tops, eyes, noses, mouths)
    @tops   = prepare(tops)
    @eyes   = prepare(eyes)
    @noses  = prepare(noses)
    @mouths = prepare(mouths)
  end

  def sample
    Face.new(@tops.sample, @eyes.sample, @noses.sample, @mouths.sample)
  end

  def modify_face(face)

  end

  private

  def prepare(string)
    string.strip.split("\n").map(&:strip)
  end
end

tops = %(
  ,,,,,,,
  _______
  __^_^__
)

mouths = %(
  | -=- |
  | *** |
  | -_- |
)

eyes = <<STR
  |<a <a|
  |<h <h|
  |(o)(o)
STR

noses = <<STR
  |  ^  |
  |  -  |
  |  ~  |
STR

generator = FaceGenerator.new(tops, eyes, noses, mouths)

def play(collection)
  system "clear"
  puts collection.sample
  sleep 0.5
end

20.times { play(generator) }

puts
puts