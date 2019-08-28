require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  before do
    customer
  end

  let(:customer) { create(:customer) }

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
    visit customer_path(customer.id)
    expect(page).to have_content customer.name
    expect(page).to have_content customer.email
    expect(page).to have_content customer.phone
  end

  scenario "customer#index" do
    customer1 = create(:customer)
    customer2 = create(:customer)

    visit customers_path
    expect(page).to have_content(customer1.name).and have_content(customer2.name)
    expect(page).to have_content(customer1.email).and have_content(customer2.email)
    expect(page).to have_content(customer1.phone).and have_content(customer2.phone)
  end

  scenario "updates a customer" do
    new_name = Faker::Name.name
    visit(edit_customer_path(customer.id))
    fill_in('Nome', with: new_name)
    click_on 'Atualizar cliente'

    expect(page).to have_content 'Cliente atualizado com sucesso!'
    expect(page).to have_content(new_name)
  end

  scenario "Click on link show - Index" do
    visit customers_path
    click_on 'Mostrar'
    expect(page).to have_content 'Mostrando cliente'
  end

  scenario "Click on link update - Index" do
    visit customers_path
    click_on 'Editar'
    expect(page).to have_content 'Editando cliente'
  end

  scenario "Click on link delete - Index", js: true do
    visit customers_path
    click_on 'Excluir'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'Cliente excluído com sucesso!'
  end
end
