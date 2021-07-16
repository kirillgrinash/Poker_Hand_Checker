class Hand
  def initialize(cards)
    @cards = cards
    @card = cards.upcase.split
    @sort_cards = @card.sort!
  end

  def number_cards
    if @card.length != 5
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

  def flush
    index = 0
    base = @card[0].slice(-1, 1)
    @card.each { |card|
      card = card.slice(-1,1) 
      unless card != base
        p card
        index += 1
        p index
      end
    }
    if index == 5
      p "true flush"
    end
  end

  # Dirty code, need to create a new approach to catch straights
  def straight
    face_card_counter = {}
    @card.each { |card|
      card = card.chop
      if face_card_counter[card] == nil
        face_card_counter[card] = 1
      else
        face_card_counter[card] += 1
      end
    }
    p face_card_counter
    if face_card_counter["A"] == 1 && face_card_counter["K"] == 1 && face_card_counter["Q"] == 1 && face_card_counter["J"] == 1 && face_card_counter["10"] == 1  
      p "Straight"
    elsif
      face_card_counter["K"] == 1 && face_card_counter["Q"] == 1 && face_card_counter["J"] == 1 && face_card_counter["10"] == 1 && face_card_counter["9"] == 1
      p "straight"
    elsif
      face_card_counter["Q"] == 1 && face_card_counter["J"] == 1 && face_card_counter["10"] == 1 && face_card_counter["9"] == 1 && face_card_counter["8"] == 1
      p "straight"
    elsif
      face_card_counter["J"] == 1 && face_card_counter["10"] == 1 && face_card_counter["9"] == 1 && face_card_counter["8"] == 1 && face_card_counter["7"] == 1
      p "straight"
    elsif
      face_card_counter["10"] == 1 && face_card_counter["9"] == 1 && face_card_counter["8"] == 1 && face_card_counter["7"] == 1 && face_card_counter["6"] == 1
      p "straight"
    elsif
      face_card_counter["9"] == 1 && face_card_counter["8"] == 1 && face_card_counter["7"] == 1 && face_card_counter["6"] == 1 && face_card_counter["5"] == 1
      p "straight"
    elsif
      face_card_counter["8"] == 1 && face_card_counter["7"] == 1 && face_card_counter["6"] == 1 && face_card_counter["5"] == 1 && face_card_counter["4"] == 1
      p "straight"
    elsif
      face_card_counter["7"] == 1 && face_card_counter["6"] == 1 && face_card_counter["5"] == 1 && face_card_counter["4"] == 1 && face_card_counter["3"] == 1
      p "straight"
    elsif
      face_card_counter["6"] == 1 && face_card_counter["5"] == 1 && face_card_counter["4"] == 1 && face_card_counter["3"] == 1 && face_card_counter["2"] == 1
      p "straight"
    elsif
      face_card_counter["5"] == 1 && face_card_counter["4"] == 1 && face_card_counter["3"] == 1 && face_card_counter["2"] == 1 && face_card_counter["A"] == 1
      p "straight"
    else
      p "no straight"
    end
  end

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

    face_card_counter.each { |face, number|
      if number == 4
        p "4 of a kind #{face}"
      elsif
        number == 3
        p "3 of a kind #{face}"
        fullhouse_counter += 1
      elsif
        number == 2
        p "2 of a kind #{face}"
        fullhouse_counter += 1
      else
        p "no pair"
      end
    }
    if fullhouse_counter == 2
      p "fullhouse"
    end
  end

end


test = Hand.new("KH 10H AD 5D 3C")
test2 = Hand.new("AH 10C JH QD KS")
bad_test = Hand.new("2H 1H 11H 11H")


# test.number_cards
# test.suit_check
# test.face_check
# test.duplicate_check
# test.flush
# test.straight
# test.pairs_fullhouse
# test.deck_sort
# bad_test.number_cards
# bad_test.suit_check
# bad_test.face_check
# bad_test.duplicate_check





