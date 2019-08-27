require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! 200 OK" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "index - JSON 200 OK" do
      get '/customers.json'
      expect(response.body).to include_json([
          id: /\d/,
          name: (be_kind_of String),
          email: (be_kind_of String)
        ])
    end

    it "show - JSON 200 OK" do
      get '/customers/37.json'
      expect(response.body).to include_json(
          id: /\d/,
          name: (be_kind_of String),
          email: (be_kind_of String)
          )
    end

    it 'Create - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT": "application/json" }

      customers_params = attributes_for(:customer)

      post "/customers.json", params: { customer: customers_params }, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customers_params[:name],
        email: customers_params.fetch(:email)
        )
    end

    it 'Update - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT": "application/json" }

      customer = Customer.first
      customer.name += " - Atualizado!"

      patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customer.name,
        email: customer.email
        )
    end

    it 'Delete - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT": "application/json" }

      customer = Customer.first

      expect{ delete "/customers/#{customer.id}.json", headers: headers }
        .to change(Customer, :count).by -1
      expect(response).to have_http_status(204)
    end
  end
end
