require './lib/tic_tac_toe'

describe TicTacToe do
  let(:red_marker) { "\e[31mX\e[0m" }
  let(:green_marker) { "\e[32m0\e[0m" }

  describe '#legal?' do
    # ordinary markers are ['1'..'9']
    context "when move is not an ordinary marker" do
      it 'returns false' do
        subject.move = '0'
        expect(subject).to_not be_legal
      end

      it 'returns false' do
        subject.move = '-1'
        expect(subject).to_not be_legal
      end

      it 'returns false' do
        subject.move = '100'
        expect(subject).to_not be_legal
      end

      it 'returns false' do
        subject.move = 'a'
        expect(subject).to_not be_legal
      end

      it 'returns false' do
        subject.move = 'X'
        expect(subject).to_not be_legal
      end

      it 'returns false' do
        subject.move = 'What is there for dinner?'
        expect(subject).to_not be_legal
      end
    end

    # special markers are 'X'.red and 'O'.green
    context 'when move is an ordinary marker but tries to replace a special marker' do
      it 'returns false' do
        subject.markers_array = [1, 2, 3, 4, 5, 6, red_marker, 8, 9]
        subject.move = '7'
        expect(subject).to_not be_legal
      end

      it 'returns false' do
        subject.markers_array = [green_marker, 2, 3, 4, 5, 6, red_marker, 8, 9]
        subject.move = '1'
        expect(subject).to_not be_legal
      end
    end

    context 'when move is an ordinary marker and tries to replace an ordinary marker' do
      it 'returns true' do
        subject.markers_array = [1, 2, 3, 4, 5, 6, red_marker, 8, 9]
        subject.move = '1'
        expect(subject).to be_legal
      end

      it 'returns false' do
        subject.markers_array = [green_marker, 2, 3, 4, 5, 6, red_marker, 8, 9]
        subject.move = '4'
        expect(subject).to be_legal
      end
    end
  end
end
