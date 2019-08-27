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

  scenario "Create a valid client" do
    visit new_customer_path
    customer_name = Faker::Name.name

    fill_in('Nome', with: customer_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Telefone', with: Faker::PhoneNumber.phone_number)
    attach_file('Foto do perfil', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: %w[S N].sample)

    expect(page).to have_content 'Cliente cadastrado com sucesso!'
    expect(Customer.last.name).to eq customer_name
  end
end
