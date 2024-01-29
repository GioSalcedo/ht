# spec/system/user_registration_spec.rb
require 'rails_helper'

RSpec.describe 'Registro de Usuario', type: :system do
  let(:existing_user) { create(:user, email: 'usuario_existente@example.com') }

  it 'evita el registro con un correo ya utilizado' do
    existing_user # Crea el usuario existente antes de visitar la página de registro
    visit new_user_registration_path

    fill_in 'Correo electrónico', with: 'usuario_existente@example.com'
    fill_in 'Contraseña', with: 'nuevacontrasena'
    fill_in 'Confirmar contraseña', with: 'nuevacontrasena'
    click_button 'Registrarse'

    expect(page).to have_content('Correo ya está siendo utilizado')
  end
end
