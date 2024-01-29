RSpec.describe 'Inicio de Sesión', type: :system do
  it 'permite iniciar sesión con un correo registrado' do
    # Crear un usuario directamente en la base de datos
    User.create(email: 'usuario@example.com', password: 'password123')

    visit new_user_session_path

    fill_in 'Correo electrónico', with: 'usuario@example.com'
    fill_in 'Contraseña', with: 'password123'
    click_button 'Iniciar Sesión'

    expect(page).to have_content('Sesión iniciada correctamente')
  end
end
