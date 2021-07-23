require 'rspec'

RSpec.describe Hand do
  describe "number_cards" do
    it "should return true for 5 cards" do
      poker_hand = Hand.new
      result = poker_hand.number_cards("AD", "10H", "3C", "KS", "4H")
      expect(result).to eq(true)
    end
  end
end