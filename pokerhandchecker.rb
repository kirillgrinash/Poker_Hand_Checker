class Hand
  
  def initialize(cards)
    @cards = cards
    @card = cards.upcase.split
  end

  def number_cards
    if @card.length != 5
      p "Invalid card number, please enter 5 cards"
      return false
    end
    true
  end

  def face_check
    @card.each { |card|
      card = card.chop
      unless card == "A" || card == "J" || card == "Q" || card == "K" || card.to_i.between?(2, 10) == true
        p "Invalid face input #{card}"
        return false
      end
    }
    true
  end

  def suit_check
    @card.each { |card|
      card = card.slice(-1,1)
      if card != "H" && card != "D" && card != "C" && card != "S"
        p "Invalid suit input #{card}"
        return false
      end
    }
    true
  end

  def duplicate_check
    index = 1
    @card.each do |card|
      card_check = card
      while index <= @card.length
        if card_check == @card[index]
          p "error duplicate card found #{card_check}"
          return false
        end
        index += 1
      end
      index = @card.index(card_check) + 2
    end
    true
  end

  # Checks for Straight Flush, Flush and Straight
  # Dirty code, need to create a new approach to catch straights
  def straight_flush
    straight = 0
    flush = 0
    face_card_counter = {}
    @card.each { |card|
      card = card.chop
      if face_card_counter[card] == nil
        face_card_counter[card] = 1
      else
        face_card_counter[card] += 1
      end
    }
    if face_card_counter["A"] == 1 && face_card_counter["K"] == 1 && face_card_counter["Q"] == 1 && face_card_counter["J"] == 1 && face_card_counter["10"] == 1  
      straight += 1
    elsif
      face_card_counter["K"] == 1 && face_card_counter["Q"] == 1 && face_card_counter["J"] == 1 && face_card_counter["10"] == 1 && face_card_counter["9"] == 1
      straight += 1
    elsif
      face_card_counter["Q"] == 1 && face_card_counter["J"] == 1 && face_card_counter["10"] == 1 && face_card_counter["9"] == 1 && face_card_counter["8"] == 1
      straight += 1
    elsif
      face_card_counter["J"] == 1 && face_card_counter["10"] == 1 && face_card_counter["9"] == 1 && face_card_counter["8"] == 1 && face_card_counter["7"] == 1
      straight += 1
    elsif
      face_card_counter["10"] == 1 && face_card_counter["9"] == 1 && face_card_counter["8"] == 1 && face_card_counter["7"] == 1 && face_card_counter["6"] == 1
      straight += 1
    elsif
      face_card_counter["9"] == 1 && face_card_counter["8"] == 1 && face_card_counter["7"] == 1 && face_card_counter["6"] == 1 && face_card_counter["5"] == 1
      straight += 1
    elsif
      face_card_counter["8"] == 1 && face_card_counter["7"] == 1 && face_card_counter["6"] == 1 && face_card_counter["5"] == 1 && face_card_counter["4"] == 1
      straight += 1
    elsif
      face_card_counter["7"] == 1 && face_card_counter["6"] == 1 && face_card_counter["5"] == 1 && face_card_counter["4"] == 1 && face_card_counter["3"] == 1
      straight += 1
    elsif
      face_card_counter["6"] == 1 && face_card_counter["5"] == 1 && face_card_counter["4"] == 1 && face_card_counter["3"] == 1 && face_card_counter["2"] == 1
      straight += 1
    elsif
      face_card_counter["5"] == 1 && face_card_counter["4"] == 1 && face_card_counter["3"] == 1 && face_card_counter["2"] == 1 && face_card_counter["A"] == 1
      straight += 1
    end

    index = 0
    base = @card[0].slice(-1, 1)
    @card.each { |card|
      card = card.slice(-1,1) 
      unless card != base
        index += 1
      end
    }
    if index == 5
      flush += 1
    end

    if straight + flush == 2
      p "Straight Flush"
    elsif
      straight == 1
      p "Straight"
    elsif
      flush == 1
      p "Flush"
    end

  end

  # checks for pairs and fullhouse
  def pairs_fullhouse
    face_card_counter = {}
    fullhouse_counter = 0
    @card.each { |card|
      card = card.chop
      if face_card_counter[card] == nil
        face_card_counter[card] = 1
      else
        face_card_counter[card] += 1
      end
    }
    arr = []
    face_card_counter.each { |face, number|
      if number == 4
        p "4 of a kind #{face}"
        arr << 4
      elsif
        number == 3
        p "3 of a kind #{face}"
        fullhouse_counter += 1
        arr << 3
      elsif
        number == 2
        p "2 of a kind #{face}"
        fullhouse_counter += 1
        arr << 2
      end
    }
    if fullhouse_counter == 2
      p "Fullhouse"
      arr << "F"
    end
    p arr
    p face_card_counter
  end

end


# puts "Hello! Please enter 5 cards. Example: AD 10H 3C KS 4H"
# puts "First is the card face and last is the card suit"
# input = gets.chomp
# poker_hand = Hand.new(input)
# poker_hand.number_cards
# poker_hand.face_check
# poker_hand.suit_check
# poker_hand.duplicate_check
# poker_hand.straight_flush
# poker_hand.pairs_fullhouse

def run
  puts "Hello! Please enter 5 cards. Example: AD 10H 3C KS 4H"
  puts "First is the card face and last is the card suit"
  input = gets.chomp
  poker_hand = Hand.new(input)
  return unless poker_hand.number_cards
  return unless poker_hand.face_check
  return unless poker_hand.suit_check
  return unless poker_hand.duplicate_check
  poker_hand.straight_flush
  poker_hand.pairs_fullhouse
end

run

require 'rspec'

RSpec.describe Hand do

  # Test number_cards valid input
  describe "number_cards" do
    it "should return true for 5 cards" do
      poker_hand = Hand.new("AD 10H 3C KS 4H")
      result = poker_hand.number_cards
      expect(result).to eq(true)
    end
  end

  # Test number_cards invalid input
  describe "number_cards" do
    it "should return false Invalid card number, please enter 5 cards" do
      poker_hand = Hand.new("AD 10H 3C")
      result = poker_hand.number_cards
      expect(result).to eq(false)
    end
  end

  # Test face_check valid input
  describe "face_check" do
    it "should return true, all cards have a valid face" do
      poker_hand = Hand.new("AD 10H 3C KS 4H")
      result = poker_hand.face_check
      expect(result).to eq(true)
    end
  end

  # Test face_check invalid input
  describe "face_check" do
    it "should return false, invalid card face found" do
      poker_hand = Hand.new("AD 11H 3C 1S 4H")
      result = poker_hand.face_check
      expect(result).to eq(false)
    end
  end

  # Test suit_check valid input
  describe "suit_check" do
    it "should return true, all cards have a valid suit" do
      poker_hand = Hand.new("AD 10H 3C 2S 4H")
      result = poker_hand.suit_check
      expect(result).to eq(true)
    end
  end

  # Test suit_check invalid input
  describe "suit_check" do
    it "should return false, invalid card suit found" do
      poker_hand = Hand.new("AZ 10H 3C 2S 4H")
      result = poker_hand.suit_check
      expect(result).to eq(false)
    end
  end

  # Test duplicate_check valid input
  describe "duplicate_check" do
    it "should return true, no duplicate cards found" do
      poker_hand = Hand.new("AD 10H 3C 2S 4H")
      result = poker_hand.duplicate_check
      expect(result).to eq(true)
    end
  end

  # Test duplicate_check invalid input
  describe "duplicate_check" do
    it "should return false, duplicate cards found" do
      poker_hand = Hand.new("AD 10H 10H 2S 4H")
      result = poker_hand.duplicate_check
      expect(result).to eq(false)
    end
  end

end

