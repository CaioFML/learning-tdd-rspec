require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario "verifies link to customer#index" do
    visit root_path
    expect(page).to have_link 'Cadastro de clientes'
  end

  scenario "verifies link to new client" do
    visit root_path
    click_on 'Cadastro de clientes'
    expect(page).to have_content 'Listando clientes'
    expect(page).to have_link 'Novo cliente'
  end

  scenario "verifies form of new client" do
    visit customers_path
    click_on('Novo cliente')
    expect(page).to have_content 'Novo cliente'
  end
end
