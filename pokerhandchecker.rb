class Hand
  def initialize(cards)
    @cards = cards
    @card = cards.upcase.split
  end

  def number_cards
    if @cards.split.length != 5
      p "invalid card number"
    end
  end

  def face_check
    @card.each { |card|
      card = card.chop
      if card == "A" || card == "J" || card == "Q" || card == "K"
        p "valid letter face"
      elsif card.to_i.between?(2, 10) == true
        p "valid number face"
      else
        p "invalid face"
      end
    }
  end

  def suit_check
    @card.each { |card|
      card = card.slice(-1,1)
      if card != "H" && card != "D" && card != "C" && card != "S"
        p "invalid suit"
      else
        p "valid suit"
      end
    }
  end

  def duplicate_check
    index = 0
    index_2 = 1
    while index < @card.length
      card_check = @card[index]
      while index_2 <= @card.length
        if card_check == @card[index_2]
        p "error duplicate card found #{card_check}"
        end
        index_2 += 1
      end
      index += 1
      index_2 = index + 1
    end
  end
end


# test = Hand.new("AH 3H 4H 5H 10C")
# bad_test = Hand.new("2H 1H 11H 11H")

# test.number_cards
# test.suit_check
# test.face_check
# bad_test.duplicate_check
# bad_test.number_cards





