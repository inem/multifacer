class Face
  attr_accessor :top, :eyes, :nose, :mouth

  def initialize(top, eyes, nose, mouth)
    @top   = top.strip
    @eyes  = eyes.strip
    @nose  = nose.strip
    @mouth = mouth.strip
  end

  def modify(library, part = :eyes)
    part_value = (library.send(part) - [self.send(part)]).sample
    self.send("#{part}=", part_value)
    self
  end

  def invalid?
    @top.empty? || @eyes.empty? || @nose.empty? || @mouth.empty?
  end

  def to_s
    "#{@top}\n#{@eyes}\n#{@nose}\n#{@mouth}"
  end
end
