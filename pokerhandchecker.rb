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
    @card.each do |card|
      card = card.chop
      unless card == "A" || card == "J" || card == "Q" || card == "K" || card.to_i.between?(2, 10) == true
        p "Invalid face input #{card}"
        return false
      end
    end
    true
  end

  def suit_check
    @card.each do |card|
      card = card.slice(-1,1)
      if card != "H" && card != "D" && card != "C" && card != "S"
        p "Invalid suit input #{card}"
        return false
      end
    end
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
  # Should be divided up and simplified
  def straight_flush
    straight = 0
    flush = 0
    face_card_counter = {}
    @card.each do |card|
      card = card.chop
      if face_card_counter[card] == nil
        face_card_counter[card] = 1
      else
        face_card_counter[card] += 1
      end
    end
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
    @card.each do |card|
      card = card.slice(-1,1) 
      unless card != base
        index += 1
      end
    end
    if index == 5
      flush += 1
    end

    if straight + flush == 2
      return p "Straight Flush"
    elsif
      straight == 1
      return p "Straight"
    elsif
      flush == 1
      return p "Flush"
    else
      return false
    end

  end

  # Checks for pairs and fullhouse
  # Should be divided up
  def pairs_fullhouse
    face_card_counter = {}
    arr = []
    @card.each do |card|
      card = card.chop
      if face_card_counter[card] == nil
        face_card_counter[card] = 1
      else
        face_card_counter[card] += 1
      end
    end
    
    face_card_counter.each do | _ , number|
      if number == 4
        arr << "a"
      elsif
        number == 3
        arr << "b"
      elsif
        number == 2
        arr << "c"
      end
    end

    arr.sort!
    if arr[0] == "a"
      return p "Four of a kind"
    elsif
      arr[0] == "b" && arr[1] == "c"
      return p "Full house"
    elsif
      arr[0] == "b" 
      return p "Three of a kind"
    elsif
      arr[0] == "c" 
      return p "Two pair"
    else
      false
    end
  end

end

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

  # Test straight_flush triggers straight flush
  describe "straight_flush" do
    it "should return straight_flush" do
      poker_hand = Hand.new("JC 10C 9C 8C 7C")
      result = poker_hand.straight_flush
      expect(result).to eq("Straight Flush")
    end
  end

  # Test straight_flush triggers flush
  describe "straight_flush" do
    it "should return flush" do
      poker_hand = Hand.new("JD 9D 8D 4D 3D")
      result = poker_hand.straight_flush
      expect(result).to eq("Flush")
    end
  end

  # Test straight_flush triggers straight
  describe "straight_flush" do
    it "should return straight" do
      poker_hand = Hand.new("10D 9S 8H 7D 6C")
      result = poker_hand.straight_flush
      expect(result).to eq("Straight")
    end
  end

  # Test straight_flush return false, no trigger
  describe "straight_flush" do
    it "should return false, no trigger" do
      poker_hand = Hand.new("10D 2S 8H AD 6C")
      result = poker_hand.straight_flush
      expect(result).to eq(false)
    end
  end

  # Test pairs_fullhouse return full house
  describe "pairs_fullhouse" do
    it "should return full house" do
      poker_hand = Hand.new("10D 10S 10H AD AC")
      result = poker_hand.pairs_fullhouse
      expect(result).to eq("Full house")
    end
  end

  # Test pairs_fullhouse return four of a kind
  describe "pairs_fullhouse" do
    it "should return four of a kind" do
      poker_hand = Hand.new("10D 10S 10H 10C AC")
      result = poker_hand.pairs_fullhouse
      expect(result).to eq("Four of a kind")
    end
  end

  # Test pairs_fullhouse return three of a kind
  describe "pairs_fullhouse" do
    it "should return three of a kind" do
      poker_hand = Hand.new("10D 10S 10H 5C AC")
      result = poker_hand.pairs_fullhouse
      expect(result).to eq("Three of a kind")
    end
  end

  # Test pairs_fullhouse return two pair
  describe "pairs_fullhouse" do
    it "should return two pair" do
      poker_hand = Hand.new("10D 10S 6H 5C AC")
      result = poker_hand.pairs_fullhouse
      expect(result).to eq("Two pair")
    end
  end

  # Test pairs_fullhouse return false
  describe "pairs_fullhouse" do
    it "should return false" do
      poker_hand = Hand.new("10D 6S 8H 5C AC")
      result = poker_hand.pairs_fullhouse
      expect(result).to eq(false)
    end
  end

end

