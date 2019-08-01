describe (1..5), "Ranges" do
  context "#cover" do
    it { is_expected.to cover(2) }
    it { expect(subject).to cover(2, 5) }
    it { expect(subject).not_to cover(0, 6) }
  end
end
