require "tictactoe"

describe Game do

  game = Game.new

  describe "#line?" do

    class Game
      attr_writer :player1, :player2, :turns
    end

    context "when given an impossible player array, containing 0" do
      before(:each) do
        game.player1 = [0, 3, 6]
      end

      it "returns false" do
        expect(game.line?).to be false
      end
    end

    context "when given a won game" do
      before(:each) do
        game.player1 = [1, 9, 3, 6]
        game.player2 = [5, 7, 2]
      end

      it "returns true" do
        expect(game.line?).to be true
      end
    end

    context "when given a perfect, tied game" do
      before do
        game.player1 = [1, 9, 2, 7, 6]
        game.player2 = [5, 8, 3, 4]
        game.turns = 9
      end

      it "returns false but the game is over" do
        expect(game.line?).to be false
        expect(game.over?).to be true
      end
    end
  end

end
