require 'rails_helper'

RSpec.feature "Customers", type: :feature, js: true do
  it 'visit index page' do
    visit customers_path
    page.save_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path)
  end
end
