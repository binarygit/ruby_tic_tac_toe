require './lib/match'

describe Match do
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

  describe '#verdict' do

    context 'when top row has same marker' do
      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { red_marker }
        subject.current_player = current_player
        subject.markers_array = [red_marker, red_marker, red_marker, 4, 5, 6, 7, 8, 9]

        expect(subject.verdict).to eq('win')
      end

      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { green_marker }
        subject.current_player = current_player
        subject.markers_array = [green_marker, green_marker, green_marker, 4, 5, 6, 7, 8, 9]

        expect(subject.verdict).to eq('win')
      end
    end 

    context 'when middle row has same marker' do
      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { red_marker }
        subject.current_player = current_player
        subject.markers_array = [1, 2, 3, red_marker, red_marker, red_marker, 7, 8, 9]

        expect(subject.verdict).to eq('win')
      end

      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { green_marker }
        subject.current_player = current_player
        subject.markers_array = [1, 2, 3, green_marker, green_marker, green_marker, 7, 8, 9]

        expect(subject.verdict).to eq('win')
      end
    end 

    context 'when bottom row has same marker' do
      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { red_marker }
        subject.current_player = current_player
        subject.markers_array = [1, 2, 3, 4, 5, 6, red_marker, red_marker, red_marker]

        expect(subject.verdict).to eq('win')
      end

      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { green_marker }
        subject.current_player = current_player
        subject.markers_array = [1, 2, 3, 4, 5, 6, green_marker, green_marker, green_marker]

        expect(subject.verdict).to eq('win')
      end
    end 

    context 'when left-to-right diagonal has same marker' do
      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { red_marker }
        subject.current_player = current_player
        subject.markers_array = [red_marker, 2, 3, 4, red_marker, 6, 7, 8, red_marker]

        expect(subject.verdict).to eq('win')
      end

      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { green_marker }
        subject.current_player = current_player
        subject.markers_array = [green_marker, 2, 3, 4, green_marker, 6, 7, 8, green_marker]

        expect(subject.verdict).to eq('win')
      end
    end 

    context 'when right-to-left diagonal has same marker' do
      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { red_marker }
        subject.current_player = current_player
        subject.markers_array = [1, 2, red_marker, 4, red_marker, 6, red_marker, 8, 9]

        expect(subject.verdict).to eq('win')
      end

      it 'returns win' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { green_marker }
        subject.current_player = current_player
        subject.markers_array = [1, 2, green_marker, 4, green_marker, 6, green_marker, 8, 9]

        expect(subject.verdict).to eq('win')
      end
    end 

    context 'when no identical markers have lined up in rows or diagonals and all ordinary markers are gone' do
      it 'returns draw' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { green_marker }
        subject.current_player = current_player
        subject.markers_array = [green_marker, red_marker, red_marker, red_marker, red_marker, green_marker, green_marker, green_marker, red_marker]

        expect(subject.verdict).to eq('draw')
      end
    end 

    context 'when no moves have been made' do
      it 'returns nil' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { red_marker }
        subject.current_player = current_player

        expect(subject.verdict).to be_nil
      end
    end 


    context 'when no identical markers have lined up diagonal or otherwise and ordinary markers still remain' do
      it 'returns nil' do
        current_player = double('player')
        allow(current_player).to receive(:marker) { red_marker }
        subject.current_player = current_player
        subject.markers_array = [1, red_marker, red_marker, red_marker, red_marker, green_marker, green_marker, green_marker, red_marker]

        expect(subject.verdict).to be_nil
      end
    end 

  end
end
