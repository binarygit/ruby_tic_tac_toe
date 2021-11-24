require './lib/string.rb'

describe String do
  describe '#red' do
    it 'makes string red' do
      string = 'a'.red
      expect(string).to eql("\e[31ma\e[0m")
    end

    it 'makes multiple strings red' do
      string = 'A very bad fox.'.red
      expect(string).to eql("\e[31mA very bad fox.\e[0m")
    end
  end

  describe '#green' do
    it 'makes string green' do
      string = 'a'.green
      expect(string).to eql("\e[32ma\e[0m")
    end

    it 'makes multiple strings green' do
      string = 'A very bad fox.'.green
      expect(string).to eql("\e[32mA very bad fox.\e[0m")
    end
  end
end
