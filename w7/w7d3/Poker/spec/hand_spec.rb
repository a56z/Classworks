require_relative 'rspec'
require_relative 'hand'
require_relative 'card'

describe Hand do
    let(:cards) {[
                Card.new(:spades, :ten),
                Card.new(:hearts, :five),
                Card.new(:hearts, :ace),
                Card.new(:diamonds, :two),
                Card.new(:hearts, :two)
            ]}

    subject(:hand { Hand.new(cards) }    

    describe '#initialize' do
        it "accepts cards correctly" do        
            expect(cards).to eq(5)
        end
    end
end