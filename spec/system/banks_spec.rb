require 'rails_helper'

RSpec.describe 'CRUD de bancos', type: :system do
  it 'permite crear un nuevo banco' do
    visit new_bank_path

    fill_in 'Nombre', with: 'Banco Ejemplo'
    click_button 'Guardar'

    expect(page.find('.alert')).to have_content('Banco creado correctamente')
  end

  it 'rechaza un banco con un nombre de más de 50 caracteres' do
    visit new_bank_path

    fill_in 'Nombre', with: 'Banco con un nombre que excede los 50 caracteres' * 2
    click_button 'Guardar'

    expect(page).to have_content('Nombre es demasiado largo (máximo 50 caracteres)')
  end

  it 'muestra la lista de bancos' do
    create(:bank, name: 'Banco A')

    visit banks_path

    expect(page).to have_content('Banco A')
  end

  it 'permite actualizar un banco existente' do
    bank = create(:bank, name: 'Banco Original')

    visit edit_bank_path(bank)

    fill_in 'Nombre', with: 'Banco Modificado'
    click_button 'Guardar cambios'

    expect(page).to have_content('Banco actualizado correctamente')
  end

  it 'permite eliminar un banco existente' do
    bank = create(:bank, name: 'Banco a Eliminar')

    visit banks_path
    click_link 'Eliminar', href: bank_path(bank)

    expect(page).to have_content('Banco eliminado correctamente')
  end
end
