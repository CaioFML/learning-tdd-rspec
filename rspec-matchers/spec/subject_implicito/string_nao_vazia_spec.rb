require 'string_nao_vazia'

# Subject implicito pega o describe mais interno.

describe String do
  describe StringNaoVazia do
    it 'subject implicito' do
      expect(subject).to eq "Nao sou vazio"
    end
  end
end
