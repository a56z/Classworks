require_relative './poker_hands'

class Hand
    include PokerHands

    attr_reader :cards
    def initialize(cards)
        raise "must have 5 cards" if cards.count != 5
        @cards = cards.sort
    end
end