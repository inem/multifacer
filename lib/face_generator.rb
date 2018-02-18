require 'ostruct'
require 'yaml'

class FaceGenerator
  attr_reader :tops, :eyes, :noses, :mouths

  def self.from_yaml(filepath)
    contents = IO.read(filepath)
    yaml = YAML.load(contents)
    struct = OpenStruct.new(yaml)
    new(struct.tops, struct.eyes, struct.noses, struct.mouths)
  end

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
