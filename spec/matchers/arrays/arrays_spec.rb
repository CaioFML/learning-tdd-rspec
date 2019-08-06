RSpec::Matchers.define_negated_matcher :exclude, :include

describe Array.new([1,2,3]) do
  it '#include' do
    expect(subject).to include 2
    expect(subject).to include 2, 1
  end

  it { is_expected.to exclude 4 }

  it '#match_array' do
    expect(subject).to match_array [1, 2, 3]
  end

  it '#contain_exactly - Não precisa passar o valor em um array' do
    expect(subject).to contain_exactly 2, 1, 3
  end
end
