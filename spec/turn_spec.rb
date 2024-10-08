# typed: ignore

# rubocop:disable Lint/MissingCopEnableDirective
# rubocop: disable Metrics/BlockLength
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new('question', 'answer', :category)
    @turn = Turn.new('guess', @card)
  end

  it 'exists' do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it 'has a card' do
    expect(@turn.card).to be_an_instance_of(Card)
  end

  it 'has the "guess" attribute that equals the guess input' do
    expect(@turn.guess).to eq('guess')
  end

  describe 'feedback' do
    it 'gives correct feedback when guess is correct' do
      turn = Turn.new('answer', @card)
      expect(turn.feedback).to eq('Correct!')
    end

    it 'gives correct feedback when guess is incorrect' do
      expect(@turn.feedback).to eq("Incorrect. The correct answer is #{@card.answer}")
    end
  end

  describe '.correct?' do
    it 'returns true from .guess? when guess is correct' do
      turn = Turn.new('answer', @card)
      expect(turn.correct?).to eq(true)
    end

    it 'returns false from .guess? when guess is incorrect' do
      expect(@turn.correct?).to eq(false)
    end
  end
end
