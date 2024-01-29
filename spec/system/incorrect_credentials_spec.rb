# spec/system/incorrect_credentials_spec.rb
require 'rails_helper'

RSpec.describe 'Credenciales Incorrectas', type: :system do
  let(:user) { create(:user, email: 'usuario@example.com', password: 'contrasena123') }

  it 'muestra una alerta al intentar iniciar sesión con credenciales incorrectas' do
    user # Crea el usuario antes de visitar la página de inicio de sesión
    visit new_user_session_path

    fill_in 'Correo electrónico', with: 'usuario@example.com'
    fill_in 'Contraseña', with: 'contrasenaincorrecta'
    click_button 'Iniciar Sesión'

    expect(page).to have_content('Correo o contraseña incorrectos')
  end
end
