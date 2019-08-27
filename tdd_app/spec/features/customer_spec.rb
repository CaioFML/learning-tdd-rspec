require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario "verifies link to customer#index" do
    visit root_path
    expect(page).to have_link 'Cadastro de clientes'
  end

  scenario "verifies link to new customer" do
    visit root_path
    click_on 'Cadastro de clientes'
    expect(page).to have_content 'Listando clientes'
    expect(page).to have_link 'Novo cliente'
  end

  scenario "verifies form of new customer" do
    visit customers_path
    click_on('Novo cliente')
    expect(page).to have_content 'Novo cliente'
  end

  scenario "Create a valid customer" do
    visit new_customer_path
    customer_name = Faker::Name.name

    fill_in('Nome', with: customer_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Telefone', with: Faker::PhoneNumber.phone_number)
    attach_file('Foto do perfil', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: %w[S N].sample)
    click_on 'Criar cliente'

    expect(page).to have_content 'Cliente cadastrado com sucesso!'
    expect(Customer.last.name).to eq customer_name
  end

  scenario 'Dont create a invalid customer' do
    visit new_customer_path
    click_on 'Criar cliente'
    expect(page).to have_content 'não pode ficar em branco'
  end

  scenario "show one customer" do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['S', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit customer_path(customer.id)
    expect(page).to have_content customer.name
    expect(page).to have_content customer.email
    expect(page).to have_content customer.phone
  end
end
