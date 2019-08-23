require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { create(:customer) }

  it '#full_name' do
    expect(customer.full_name).to start_with 'Sr. '
  end

  it { expect { create(:customer) }.to change { Customer.all.size}.by 1 }
end
