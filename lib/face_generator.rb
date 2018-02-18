require 'ostruct'
require 'yaml'

class FaceGenerator
  attr_reader :top, :eyes, :nose, :mouth

  def self.from_yaml(filepath)
    contents = IO.read(filepath)
    yaml = YAML.load(contents)
    struct = OpenStruct.new(yaml)

    new(struct.top, struct.eyes, struct.nose, struct.mouth)
  end

  def initialize(top, eyes, nose, mouth)
    @top   = prepare(top)
    @eyes  = prepare(eyes)
    @nose  = prepare(nose)
    @mouth = prepare(mouth)
  end

  def sample
    Face.new(@top.sample, @eyes.sample, @nose.sample, @mouth.sample)
  end

  private

  def prepare(string)
    string.strip.split("\n").map(&:strip)
  end
end
