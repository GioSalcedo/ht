require 'rails_helper'

RSpec.describe 'CRUD de bancos', type: :system do
  it 'crea un nuevo banco con éxito' do
    visit new_bank_path

    fill_in 'Nombre', with: 'Banco Ejemplo'
    click_button 'Guardar'

    expect(Bank.last).to be
  end

  it 'rechaza un banco con un nombre de más de 50 caracteres' do
    visit new_bank_path

    fill_in 'Nombre', with: 'Banco con un nombre que excede los 50 caracteres' * 2
    click_button 'Guardar'

    expect(Bank.where(name: 'Banco con un nombre que excede los 50 caracteres' * 2)).to be_empty
  end

  it 'muestra la lista de bancos' do
    visit new_bank_path
  
    fill_in 'Nombre', with: 'Banco A'
    click_button 'Guardar'
    visit banks_path

    expect(page).to have_content('Banco A')
  end

  it 'permite actualizar un banco existente' do
    visit new_bank_path

    fill_in 'Nombre', with: 'Banco Ejemplo'
    click_button 'Guardar'
    sleep 2
    visit bank_path(Bank.last)
    visit edit_bank_path(Bank.last)

    fill_in 'Nombre', with: 'Banco Actualizado'
    click_button 'Guardar'

    # Comprobamos que el nombre se ha actualizado correctamente
    expect(page).to have_content('Banco Actualizado')
  end

  it 'permite eliminar un banco existente' do
    visit new_bank_path

    fill_in 'Nombre', with: 'Banco Ejemplo'
    click_button 'Guardar'
    sleep 2
    visit bank_path(Bank.last)

    click_button 'Eliminar'

    expect(page).to have_content('Banco eliminado correctamente')
  end
end
