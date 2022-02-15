require "rspec"
require "card"

describe Card do
    describe '#initialize' do
        subject(:card) { Card.new(:spades, :ace)}
        
        it "sets up card correctly" do
            expect(card.suit).to eq(:spades)
            expect(card.value).to eq(:ace)
        end

        it "raises an error with an invalid suit" do
            expect do
                Card.new(:test, :ace)
            end.to raise_error
        end

        it "raises an error with an invalid value" do
            expect do
                Card.new(:spades, :test)
            end.to raise_error
        end
    end

    describe '#<=>' do
        it 'should return 0 when cards are the same' do
            expect(Card.new(:spades, :ace) <=> Card.new(:spades, :ace)).to eq(0)
        end
    end
end