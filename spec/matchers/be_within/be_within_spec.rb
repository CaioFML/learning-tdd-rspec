describe 'be_within' do
  it { expect(12.5).to be_within(0.5).of(12.0)}
  it { expect([12.6, 12.9, 12.4]).to all( be_within(1.0).of(12.0) ) }
end