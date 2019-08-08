require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { create(:customer) }

  it 'create a customer' do
    expect(customer.full_name).to eq 'Sr. Caio'
  end
end
