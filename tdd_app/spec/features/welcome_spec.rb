require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  scenario "shows welcome message" do
    visit root_path
    expect(page).to have_content 'Bem-Vindo'
  end

  scenario "verified link to create new clients" do
    visit root_path
    expect(find('ul li')).to have_link 'Cadastro de clientes'
  end
end
