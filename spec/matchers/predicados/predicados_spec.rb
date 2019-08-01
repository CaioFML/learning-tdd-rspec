describe "Matchers Predicados" do
  it "be_odd - .odd?" do
    expect(1).to be_odd
  end

  it "be_even - .even?" do
    expect(2).to be_even
  end

  it "be_zero - .zero?" do
    expect(0).to be_zero
  end

  it "be_empty - .empty?" do
    expect('').to be_empty
  end
end