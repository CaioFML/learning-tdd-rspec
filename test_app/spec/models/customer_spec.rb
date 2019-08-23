require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { create(:customer, name: "Caio") }

  it '#full_name' do
    expect(customer.full_name).to eq 'Sr. Caio'
  end

  it { expect { create(:user) }.to change { Customer.all.size }.by 1 }
end
