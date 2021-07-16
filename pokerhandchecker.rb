class Hand
  
  def initialize(cards)
    @cards = cards
    @card = cards.upcase.split
  end

  def number_cards
    if @card.length != 5
      p "Invalid card number, please enter 5 cards"
    end
  end

  def face_check
    @card.each { |card|
      card = card.chop
      if card == "A" || card == "J" || card == "Q" || card == "K"
      elsif card.to_i.between?(2, 10) == true
      else
        p "Invalid face input #{card}"
      end
    }
  end

  def suit_check
    @card.each { |card|
      card = card.slice(-1,1)
      if card != "H" && card != "D" && card != "C" && card != "S"
        p "Invalid suit input #{card}"
      else
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
      end
    }
    if fullhouse_counter == 2
      p "fullhouse"
    end
  end

end


puts "Hello! Please enter 5 cards. Example: AD 10H 3C KS 4H"
puts "First is the card face and last is the card suit"
input = gets.chomp
poker_hand = Hand.new(input)
poker_hand.number_cards
poker_hand.face_check
poker_hand.suit_check
poker_hand.duplicate_check
poker_hand.straight_flush
poker_hand.pairs_fullhouse



