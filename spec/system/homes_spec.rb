require 'rails_helper'

RSpec.describe 'Home', type: :system do
  it 'muestra la página de inicio con enlaces a log-in y sign-up' do
    visit root_path

    expect(page).to have_content('Bienvenido a la Página de Inicio')
    
    # Verificar enlace a log-in
    expect(page).to have_link('Iniciar sesión', href: new_user_session_path)

    # Verificar enlace a sign-up
    expect(page).to have_link('Registrarse', href: new_user_registration_path)
  end
end
