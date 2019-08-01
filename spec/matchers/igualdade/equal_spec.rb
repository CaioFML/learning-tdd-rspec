describe "Matcher de igualdade" do
  it '#equal - Testa se é o mesmo objeto' do
    x = 'ruby'
    y = 'ruby'

    expect(x).to equal x
    expect(x).not_to equal y
  end

  it '#be - testa se é o mesmo objeto' do
    x = 'ruby'
    y = 'ruby'

    expect(x).to be x
    expect(x).not_to be y
  end

  it '#eq - testa se é o mesmo valor/conteúdo' do
    x = 'ruby'
    y = 'ruby'
    z = 'RoR'

    expect(x).to eq y
    expect(x).not_to eq z
  end

  it '#eql - testa se é o mesmo valor/conteúdo' do
    x = 'ruby'
    y = 'ruby'
    z = 'RoR'

    expect(x).to eql y
    expect(x).not_to eql z
  end
end
