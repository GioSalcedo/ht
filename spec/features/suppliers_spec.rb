require 'rails_helper'

RSpec.describe 'Proveedores', type: :feature do
  it 'muestra mensajes de error si faltan campos obligatorios' do
    visit new_supplier_path

    click_button 'Guardar'

    # Here we see all the messages that are shown when the form is submitted without any data
    expect(page).to have_selector('#error_explanation')
  end

  it 'shows error messages if the fields do not meet the specified criteria' do
    Bank.create(name: 'Banco Ejemplo')

    visit new_supplier_path

    fill_in 'Nombre del Proveedor', with: ''
    fill_in 'NIT', with: '123456789'
    fill_in 'Persona de Contacto', with: 'Contacto Ejemplo'
    fill_in 'Teléfono', with: '12345678901'
    find('#supplier_bank_id').select('Banco Ejemplo', wait: 5)
    fill_in 'Número de Cuenta', with: '1234567890123456'

    click_button 'Guardar'

    expect(page).to have_selector('#error_explanation')
  end

  it 'muestra un mensaje de éxito si el registro se realiza correctamente' do
    Bank.create(name: 'Banco Ejemplo')

    visit new_supplier_path

    fill_in 'Nombre del Proveedor', with: 'Proveedor Ejemplo'
    fill_in 'NIT', with: '901362343-4'
    fill_in 'Persona de Contacto', with: 'Contacto Ejemplo'
    fill_in 'Teléfono', with: '3003003030'
    find('#supplier_bank_id').select('Banco Ejemplo', wait: 5)
    fill_in 'Número de Cuenta', with: '123456789012345'

    click_button 'Guardar'

    expect(page).to have_content('supplier creado con éxito.')
  end

  it 'muestra el nombre de los bancos en un combobox en el formulario' do
    banco1 = Bank.create(name: 'Banco A')
    banco2 = Bank.create(name: 'Banco B')

    visit new_supplier_path

    find('#supplier_bank_id').select('Banco A', wait: 5)
    find('#supplier_bank_id').select('Banco B', wait: 5)

    expect(page).to have_content('Banco A')
    expect(page).to have_content('Banco B')
  end
end
