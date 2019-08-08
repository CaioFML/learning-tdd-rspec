require 'calculator'

RSpec.describe Calculator, "sobre a calculadora" do
  context '#sum' do
    it 'with positive numbers' do
      result = subject.sum(5, 7)

      expect(result).to eq 12
      expect(result).not_to eq 11
    end

    it 'with negative numbers' do
      result = subject.sum(-5, -7)

      expect(result).to eq(-12)
    end
  end

  context '#div' do
    it "divide by 0 - Precisa passar em bloco pra interpretar o erro" do
      expect { subject.div(3, 0) }.to raise_error ZeroDivisionError # Passando o tipo do erro
      expect { subject.div(3, 0) }.to raise_error 'divided by 0' # Passando a mensagem do erro
      expect { subject.div(3, 0) }.to raise_error ZeroDivisionError, 'divided by 0' # Passando o tipo e a mensagem do erro
      expect { subject.div(3, 0) }.to raise_error(/divided/) # Passando o regex da mensagem do erro
    end
  end
end