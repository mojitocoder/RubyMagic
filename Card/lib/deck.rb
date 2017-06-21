require 'card'

class Deck
    # All ranks, from 7 to ace
    RANKS = (6..9).to_a + [:jack, :queen, :king, :ace]

    # All four suits
    SUITS = [:hearts, :clubs, :diamonds, :spades]

    def self.all
        #(1..32).to_a
        SUITS.product(RANKS).map do |suit, rank|
            Card.new(suit: suit, rank: rank)
        end
    end
end
