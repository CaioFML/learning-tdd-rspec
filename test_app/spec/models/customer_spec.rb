require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  it 'create a customer' do
    customer = customers(:caio)

    expect(customer.full_name).to eq 'Sr. Caio'
  end
end
