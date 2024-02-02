RSpec.describe 'Credenciales Incorrectas', type: :system do
  it 'muestra una alerta al intentar iniciar sesión con credenciales incorrectas' do
    # Crear un usuario directamente en la base de datos
    User.create(email: 'usuario@example.com', password: 'contrasena123')

    visit new_user_session_path

    fill_in 'Correo electrónico', with: 'usuario@example.com'
    fill_in 'Contraseña', with: 'contrasenaincorrecta'
    click_button 'Iniciar Sesión'

    expect(page).to have_content(/Correo electrónico o contraseña inválida/)
  end
end