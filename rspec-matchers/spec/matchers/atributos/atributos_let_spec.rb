require 'pessoa'

describe 'Atributos' do
  # before(:each) do
  #   puts 'ANTES'
  #   @pessoa = Pessoa.new
  # end

  let(:pessoa) { Pessoa.new }

  it "have_attributes" do
    pessoa.nome = 'Caio'
    pessoa.idade = 23

    expect(pessoa).to have_attributes nome: 'Caio', idade: 23
  end

  it 'have_attributes com outros matchers mesclados' do
    pessoa.nome = 'Caio'
    pessoa.idade = 23

    expect(pessoa).to have_attributes nome: starting_with('C'), idade: be >= 20
  end
end
