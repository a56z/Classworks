class Player
    attr_reader :bankroll, :hand, :current_bet
    def self.buy_in(bankroll)
        Player.new(bankroll)
    end

    def initialize(bankroll)
        @bankroll = bankroll
        @current_bet = 0
    end

    def deal_in(hand)
        @hand = hand
    end

    def take_bet(total_bet)
        amount = total_bet - @current_bet
        raise 'not enough money' unless bankroll >= total_bet
        @current_bet = total_bet
        @bankroll -= amount
        amount
    end

    def receive_winnings(amount)
        @bankroll += amount
    end

    def return_cards
        cards = hand.cards
        @hand = nil
        cards
    end

    def fold
        @fold = true
    end

    def unfold
        @folded = false
    end

    def folded?
        @fold
    end
end