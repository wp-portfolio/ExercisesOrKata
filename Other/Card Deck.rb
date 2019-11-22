class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end


  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

end


class Deck
  attr_accessor :dCards, :hCardsDealt

  def initialize
    @dCards = []
    @hCardsDealt = []
    @ranks = %w[2 3 4 5 6 7 8 9 10 J Q K A] #note to self about %w, means you dont need , & "" for strings in array. for spaces just escape\
    @suits = %w[clubs diamonds spades hearts]

    @suits.each do |suit|
      @ranks.each do |rank|
        @dCards << Card.new(rank, suit)
        @hCardsDealt << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @dCards.shuffle!
  end

  def deal(numberDealt=1)
    @hCardsDealt = @dCards.pop(numberDealt)
  end


  def output_hand
    puts "You were dealt:"
    @hCardsDealt.each do |card|
      card.output_card
    end
  end

end





deck = Deck.new
deck.shuffle
puts deck.dCards.size
deck.deal(3)
deck.output_hand
puts deck.dCards.size
deck.deal(3)
deck.output_hand
puts deck.dCards.size
deck.deal(3)
deck.output_hand
puts deck.dCards.size
deck.deal(100)
deck.output_hand