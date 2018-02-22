class Card
  attr_reader :value, :suit, :face_up
  def initialize(value, suit, face_up)
    @value = value
    @suit = suit
    @face_up = face_up
  end
end
