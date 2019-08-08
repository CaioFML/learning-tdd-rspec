require 'string_nao_vazia'

describe "Matchers de Classes" do
  it "be_instance_of - Exatamente a classe" do
    expect(10).to be_instance_of Integer
  end

  it "be_kind_of - Pode ser herança" do
    str = StringNaoVazia.new
    expect(str).to be_kind_of String
    expect(str).to be_kind_of StringNaoVazia
    expect(10).to be_kind_of Integer
  end

  it "be_a / be_an - O mesmo que o be_kind_of" do
    str = StringNaoVazia.new
    expect(str).to be_a StringNaoVazia
    expect("ruby").to be_a String
    expect(12).to be_an Integer
  end

  it "respond_to - Responde a um método de instancia" do
    expect("ruby").to respond_to :size
    expect("ruby").to respond_to :count
    expect("ruby").to respond_to :replace
  end
end
