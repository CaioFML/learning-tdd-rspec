require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { create(:customer, name: "Caio") }

  it '#full_name' do
    expect(customer.full_name).to eq 'Sr. Caio'
  end

  it '#vip - herança factory' do
    customer = create(:customer_default)
    expect(customer.vip).to be_falsy
  end

  it 'Usando attributes_for - Retorna um hash com os atributos' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with 'Sr. '
  end

  it 'Atributo transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it { expect { create(:user) }.to change { Customer.all.size }.by 1 }
end
