# card_spec.rb

require 'card'
RSpec.describe 'a playing card' do
    it 'has a suit' do
        raise unless Card.new(suit: :heart, rank: 5).suit == :heart
    end
    
    it 'has a rank' do
        raise unless Card.new(suit: :heart, rank: 5).rank == 5
    end

    describe 'a jack' do
        it 'ranks higher than a 10' do
            lower = Card.new(suit: :heart, rank: 10)
            higher = Card.new(suit: :heart, rank: :jack)

            raise unless higher.rank > lower.rank
        end
    end

    describe 'a queen' do
        it 'ranks higher than a jack' do
            lower = Card.new(suit: :heart, rank: :jack)
            higher = Card.new(suit: :heart, rank: :queen)

            raise unless higher.rank > lower.rank
        end
    end

    describe 'a king' do
        it 'ranks higher than a queen' do
            lower = Card.new(suit: :heart, rank: :queen)
            higher = Card.new(suit: :heart, rank: :king)

            raise unless higher.rank > lower.rank
        end
    end
end