require 'pessoa'

describe 'Atributos' do
  # before(:each) do
  #   @pessoa = Pessoa.new
  # end

  # after(:each) do
  #   @pessoa.nome = 'SEM NOME'
  #   puts @pessoa.nome
  # end

  around(:each) do |teste|
    puts 'ANTES'
    @pessoa = Pessoa.new

    teste.run # roda o teste

    puts 'DEPOIS'
    @pessoa.nome = 'SEM NOME'
    puts @pessoa.nome
  end

  it "have_attributes" do
    @pessoa.nome = 'Caio'
    @pessoa.idade = 23

    expect(@pessoa).to have_attributes nome: 'Caio', idade: 23
  end

  it 'have_attributes com outros matchers mesclados' do
    @pessoa.nome = 'Caio'
    @pessoa.idade = 23

    expect(@pessoa).to have_attributes nome: starting_with('C'), idade: be >= 20
  end
end
