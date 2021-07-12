
# /////code for checking dups//////
# index = 0
# index_2 = 1
# card_test = "AH 3H 5H 4H 2H"
# cards = card_test.split
# while index < cards.length
#   card_check = cards[index]
#   while index_2 <= cards.length
#     if card_check == cards[index_2]
#       p "error"
#     end
#     index_2 += 1
#   end
#   p card_check
#   index += 1
#   index_2 = index + 1
# end









class Hand
  def initialize(cards)
    @cards = cards
  end

  def number_cards
    if @cards.split.length != 5
      p "invalid card number"
    end
  end

  def face_check
    @cards.upcase.split.each { |card|
      if card[0] == "A" || card[0] == "J" || card[0] == "Q" || card[0] == "K"
        p "valid suit"
      # this code is awful, has to be an easier way to review 3..10, will follow back  
      # cannot use card[0] since error will occur when using 10, must correct
      elsif card[0].to_i == 2 || card[0].to_i == 3 || card[0].to_i == 4 || card[0].to_i == 5 || card[0].to_i == 6 || card[0].to_i == 7 || card[0].to_i == 8 || card[0].to_i == 9 
        p "valid suit"
      else
        p "invalid suit"
      end
    }
  end

  def suit_check
    @cards.upcase.split.each { |card|
      if card[1] != "H" && card[1] != "D" && card[1] != "C" && card[1] != "S"
        p "invalid suit"
      end
    }
  end
end


# test = Hand.new("AH 3H 4H 5H 6C")
# bad_test = Hand.new("2H 1H 11H")

# test.number_cards
# test.suit_check
# test.face_check
# bad_test.number_cards





