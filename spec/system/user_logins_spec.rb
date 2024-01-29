# spec/system/user_login_spec.rb
require 'rails_helper'

RSpec.describe 'Inicio de Sesión', type: :system do
  let(:user) { create(:user, email: 'usuario@example.com', password: 'password123') }

  it 'permite iniciar sesión con un correo registrado' do
    user # Crea el usuario antes de visitar la página de inicio de sesión
    visit new_user_session_path

    fill_in 'Correo electrónico', with: 'usuario@example.com'
    fill_in 'Contraseña', with: 'password123'
    click_button 'Iniciar Sesión'

    expect(page).to have_content('Sesión iniciada correctamente')
  end
end
