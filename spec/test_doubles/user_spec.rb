describe "Test Double" do
  it "--" do
    user = double('User')
    allow(user).to receive_messages(name: 'Caio', password: 'secret')
    allow(user).to receive(:age).and_return('23')

    expect(user.name).to eq 'Caio'
    puts user.password
    puts user.age
  end
end
