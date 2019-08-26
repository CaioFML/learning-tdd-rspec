require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'tem 1 pedido' do
    customer = create(:customer)
    order = create(:order, customer: customer)
    expect(order.customer).to be_kind_of Customer
  end

  it 'Tem 3 pedidos - create_list' do
    orders = create_pair(:order) #Vem um array de objetos criados
    expect(orders.count).to eq 2
  end

  it 'has_many association' do
    customer = create(:customer, :with_orders, qtt_orders: 5)
    expect(customer.orders.count).to eq 5
  end
end
