require 'pessoa'

describe 'Atributos' do
  it "have_attributes" do
    pessoa = Pessoa.new
    pessoa.nome = 'Caio'
    pessoa.idade = 23

    expect(pessoa).to have_attributes nome: 'Caio', idade: 23
  end

  it 'have_attributes com outros matchers mesclados' do
    pessoa = Pessoa.new
    pessoa.nome = 'Caio'
    pessoa.idade = 23

    expect(pessoa).to have_attributes nome: starting_with('C'), idade: be >= 20
  end
end
