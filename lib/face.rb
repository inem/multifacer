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
