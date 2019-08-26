require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe "As a guest" do
    context "#index" do
      it 'responds successfully' do
        get :index
        expect(response).to be_successful
      end

      it 'returns a 200 response' do
        get :index
        expect(response).to have_http_status 200
      end

      it "responds a 302 response (Not authorized)" do
        create(:customer)
        get :show, params: { id: Customer.first.id }
        expect(response).to have_http_status 302
      end
    end
  end

  describe "As logged member" do
    context "#show" do
      it 'responds a 200 response' do
        member = create(:member)
        customer = create(:customer)

        sign_in member

        get :show, params: { id: customer.id }
        expect(response).to have_http_status 200
      end

      it 'render a :show template' do
        member = create(:member)
        customer = create(:customer)

        sign_in member

        get :show, params: { id: customer.id }
        expect(response).to render_template :show
      end
    end
  end
end
