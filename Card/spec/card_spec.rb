 # card_spec.rb
require 'card'
require 'set'

RSpec.describe 'a playing card' do
    def card(params = {})
        defaults = {
            suit: :diamond,
            rank: 8,
        }

        Card.new(**defaults.merge(params))
    end
    
    describe 'cards equality' do
        it 'is equal to itself' do
            current = card(suit: :heart, rank: 4)
            other = card(suit: :heart, rank: 4)

            raise unless current == other
        end

        it 'is not equal to a card of different suit' do
            current = card(suit: :heart, rank: 4)
            other = card(suit: :diamond, rank: 4)

            raise unless current != other
        end

        it 'is not equal to a card of different rank' do
            current = card(suit: :heart, rank: :jack)
            other = card(suit: :heart, rank: 4)

            raise unless current != other
        end

        it 'has hash equal to itself' do
            current = card(suit: :clubs, rank: 7)
            other = card(suit: :clubs, rank: 7)

            raise unless Set.new([current, other]).size == 1
        end

        it 'has a different hash from a different rank' do
            current = card(suit: :clubs, rank: 7)
            other = card(suit: :clubs, rank: 8)

            raise unless Set.new([current, other]).size == 2
        end    

        it 'has a different hash from a different suit' do
            current = card(suit: :diamond, rank: 8)
            other = card(suit: :clubs, rank: 8)

            raise unless Set.new([current, other]).size == 2
        end  
    end
    

    it 'has a suit' do
        raise unless card(suit: :heart).suit == :heart
    end
    
    it 'has a rank' do
        raise unless card(rank: 5).rank == 5
    end

    describe 'a jack' do
        it 'ranks higher than a 10' do
            lower = card(rank: 10)
            higher = card(rank: :jack)

            raise unless higher.rank > lower.rank
        end
    end

    describe 'a queen' do
        it 'ranks higher than a jack' do
            lower = card(rank: :jack)
            higher = card(rank: :queen)

            raise unless higher.rank > lower.rank
        end
    end

    describe 'a king' do
        it 'ranks higher than a queen' do
            lower = card(rank: :queen)
            higher = card(rank: :king)

            raise unless higher.rank > lower.rank
        end
    end
end