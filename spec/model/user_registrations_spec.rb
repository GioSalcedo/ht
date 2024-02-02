RSpec.describe 'Registro de Usuario', type: :system do
  it 'evita el registro con un correo ya utilizado' do
    existing_user = User.create(email: 'usuario_existente@example.com', password: 'contrasena123')

    visit new_user_registration_path

    fill_in 'Correo electrónico', with: 'usuario_existente@example.com'
    fill_in 'Contraseña', with: 'nuevacontrasena'
    fill_in 'Confirmación de la contraseña', with: 'nuevacontrasena'
    click_button 'Registrarse'

    expect(page).to have_selector('#error_explanation')
  end
end
