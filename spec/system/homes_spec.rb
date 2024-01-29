require 'rails_helper'

RSpec.describe 'Home', type: :system do
  it 'muestra la página de inicio' do
    visit root_path
    expect(page).to have_content('Bienvenido a la Página de Inicio')
  end
end
