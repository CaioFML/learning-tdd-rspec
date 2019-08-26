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
      before do
        @member = create(:member)
        @customer = create(:customer)
        @customer_params = attributes_for(:customer)
        sign_in @member
      end

      it 'content-type JSON' do
        get :show, format: :json, params: { id: @customer.id }
        expect(response.content_type).to eq('application/json')
      end

      it 'content-type HTML' do
        get :show, format: :html, params: { id: @customer.id }
        expect(response.content_type).to eq('text/html')
      end

      it 'Flash Notice' do
        post :create, params: { customer: @customer_params }
        expect(flash[:notice]).to match(/successfully created/)
      end

      it 'with valid attributes' do
        expect { post :create, params: { customer: @customer_params } }
          .to change(Customer, :count).by 1
      end

      it 'responds a 200 response' do
        get :show, params: { id: @customer.id }
        expect(response).to have_http_status 200
      end

      it 'render a :show template' do
        get :show, params: { id: @customer.id }
        expect(response).to render_template :show
      end
    end
  end
end
