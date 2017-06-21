require 'deck'

describe 'Deck' do
    describe '.all' do
        it 'contains 32 cards in total' do
            expect(Deck.all.length).to eq(32)
        end
        
        it 'has a 7 as its lowest card' do
            Deck::SUITS.each do |suit|
                expect(Deck.all).to include(Card.new(suit: suit, rank: 7))
                
                expect(Deck.all.include?(Card.new(suit: suit, rank: 7))).to eq(true)

                expect(Deck.all).not_to include(Card.new(suit: suit, rank: 6))
            end
        end

        # a different way to implement matching pattern
        it 'has the minimum rank of 7' do
            expect(Deck.all.map{|card| card.rank}). to all(be >= 7)

            expect(Deck.all).to all(have_attributes(rank: be >= 7))
        end
        
    end
end
