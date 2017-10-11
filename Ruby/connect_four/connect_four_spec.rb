require_relative "connect_four"

describe Board do
  let(:board) { Board.new }

  describe "#initialize" do
    it "generates a new board" do
      expect(board.squares.size).to eq(42)
      expect(board.squares[[0,2]]).to eq("☢ ")
    end
  end

end

describe Player do
  describe "#initialize" do
    let(:player1) { Player.new("⚪ ", 'peace') }

    it "initializes a player with a symbol and a name" do
      expect(player1.symbol).to eq("⚪ ")
      expect(player1.name).to eq('peace')
    end
  end
end

describe Game do
  let(:game) { Game.new(["John", "Peggy"]) }

  describe "#initialize" do
    it "initializes a new board" do
      expect(game.board).to be
    end

    it "initializes new players" do
      expect(game.players).to be
    end
  end

  describe "#randomize_players" do
    it "sets player1 and player2 randomly" do
      expect(game.player1.name).to eq("John").or eq("Peggy")
      expect(game.player2.name).to eq("John").or eq("Peggy")
    end
  end

  describe "#play" do

  end

  describe "#move_select" do
    context "chosen column is empty" do
      before do
        $stdin = StringIO.new("3\n")
      end

      after do
        $stdin = STDIN
      end

      it "changes [3, 0] to current player's symbol" do
        game.move_select(game.player1)
        expect(game.board.squares[[3, 0]]).to eq(game.player1.symbol)
      end
    end
  end

  describe "#line?" do
    context "with a board without a line" do
      it "returns false" do
        expect(game.line?).to be false
      end
    end

    context "with a board with a horizontal line" do
      before do
        game.board.squares[[1,0]] = "⏺ "
        game.board.squares[[2,0]] = "⏺ "
        game.board.squares[[3,0]] = "⏺ "
        game.board.squares[[4,0]] = "⏺ "
      end

      after do
        game.board.generate_squares
      end
      it "returns true" do
        expect(game.line?).to be true
      end
    end

    context "with a board with a vertical line" do
      before do
        game.board.squares[[1,0]] = "⚪ "
        game.board.squares[[1,1]] = "⚪ "
        game.board.squares[[1,2]] = "⚪ "
        game.board.squares[[1,3]] = "⚪ "
      end

      after do
        game.board.generate_squares
      end
      it "returns true" do
        expect(game.line?).to be true
      end
    end

    context "with a board with a 'positive' diagonal line" do
      before do
        game.board.squares[[3,2]] = "⚪ "
        game.board.squares[[4,3]] = "⚪ "
        game.board.squares[[5,4]] = "⚪ "
        game.board.squares[[6,5]] = "⚪ "
      end

      after do
        game.board.generate_squares
      end
      it "returns true" do
        expect(game.line?).to be true
      end
    end

    context "with a board with a 'negative' diagonal line" do
      before do
        game.board.squares[[0,4]] = "⏺ "
        game.board.squares[[1,3]] = "⏺ "
        game.board.squares[[2,2]] = "⏺ "
        game.board.squares[[3,1]] = "⏺ "
      end

      after do
        game.board.generate_squares
      end
      it "returns true" do
        expect(game.line?).to be true
      end
    end
  end

  describe "#neighbors" do
    context "with a square not on the edge of the board" do
      it "returns its less than four neighbors" do
        expect(game.neighbors([0, 5])).to eq({:right => [1,5], :down => [1,4]})
      end
    end

    context "with a square in the middle of the board" do
      it "returns its four neighbors" do
        expect(game.neighbors([4,3])).to eq({:up => [4,4], :diag => [5,4], :right => [5,3], :down => [5,2]})
      end
    end
  end

  describe "#check_height" do
    context "chosen column is empty" do
      it "places tile on '0'" do
        expect(game.check_height(3)).to eq(0)
      end

      context "chosen column is neither empty nor full" do
        before do
          game.board.squares[[4,0]] = "⚪ "
          game.board.squares[[4,1]] = "⚪ "
          game.board.squares[[4,2]] = "⏺ "
        end

        it "places tile at the correct height" do
          expect(game.check_height(4)).to eq(3)
        end
      end

      context "chosen column is full" do
        before do
          game.board.squares[[5,0]] = "⏺ "
          game.board.squares[[5,1]] = "⏺ "
          game.board.squares[[5,2]] = "⚪ "
          game.board.squares[[5,3]] = "⏺ "
          game.board.squares[[5,4]] = "⏺ "
          game.board.squares[[5,5]] = "⚪ "
        end

        it "returns a y value of '6'" do
          expect(game.check_height(5)).to eq(6)
        end
      end
    end
  end

end
