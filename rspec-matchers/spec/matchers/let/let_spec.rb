$counter = 0

describe "let" do
  let(:count) { $counter += 1 }

  it 'memoriza o valor' do
    expect(count).to eq 1 # primeira vez
    expect(count).to eq 1 # 2a Cache
  end

  it 'não é cacheado entre os testes' do
    expect(count).to eq 2
  end
end
