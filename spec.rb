require('minitest/autorun')
require('minitest/reporters')

require_relative('./card_game')
require_relative('./card')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestCardGame < Minitest::Test

  def setup( )
    @card1 = Card.new("Spade", 1)
    @card2 = Card.new("Heart", 4)
    @card3 = Card.new("Club", 7)
    @card4 = Card.new("Diamond", 10)
    @cards = [@card1, @card2, @card3, @card4]
    @card_game = CardGame.new()
  end

  def test_checkforAce
    assert_equal(true, @card_game.checkforAce(@card1))
  end

  def test_highestcard
    assert_equal(@card2, @card_game.highest_card(@card1, @card2))
  end

  def test_cardstotal
    expected_result = "You have a total of 22"
    actual_result = CardGame.cards_total(@cards)
    assert_equal(expected_result, actual_result)
  end

end
