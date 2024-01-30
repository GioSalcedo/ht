require 'rails_helper'

RSpec.describe 'Proveedores', type: :feature do
  it 'muestra mensajes de error si faltan campos obligatorios' do
    visit new_supplier_path

    click_button 'Guardar'

    expect(page).to have_content('Nombre del proveedor no puede estar en blanco')
    expect(page).to have_content('Persona de contacto no puede estar en blanco')
    expect(page).to have_content('Nombre del banco no puede estar en blanco')
  end

  it 'muestra mensajes de error si los campos no cumplen con las características indicadas' do
    visit new_supplier_path

    fill_in 'Nombre del proveedor', with: 'Proveedor Ejemplo'
    fill_in 'NIT del proveedor', with: '123456789'
    fill_in 'Nombre de la persona de contacto', with: 'Contacto Ejemplo'
    fill_in 'Número de celular de la persona de contacto', with: '12345678901'
    fill_in 'Nombre del banco del proveedor', with: 'Banco Ejemplo'
    fill_in 'Número de cuenta bancaria', with: '1234567890123456'

    click_button 'Guardar'

    expect(page).to have_content('NIT del proveedor no es válido. Debe seguir el formato 9 dígitos, un guión medio (-) y un dígito opcional.')
    expect(page).to have_content('Número de celular de la persona de contacto no es válido. Máximo 10 caracteres permitidos.')
    expect(page).to have_content('Número de cuenta bancaria es demasiado largo (máximo 15 caracteres). Debe ser opcional.')
  end

  it 'muestra un mensaje de éxito si el registro se realiza correctamente' do
    visit new_supplier_path

    fill_in 'Nombre del proveedor', with: 'Proveedor Ejemplo'
    fill_in 'NIT del proveedor', with: '901362343-4'
    fill_in 'Nombre de la persona de contacto', with: 'Contacto Ejemplo'
    fill_in 'Nombre del banco del proveedor', with: 'Banco Ejemplo'

    click_button 'Guardar'

    expect(page).to have_content('La información se llenó de forma correcta')
    expect(page).not_to have_content('NIT del proveedor no es válido')
  end

  it 'muestra el nombre de los bancos en un combobox en el formulario' do
    banco1 = Banco.create(nombre: 'Banco A')
    banco2 = Banco.create(nombre: 'Banco B')

    visit new_supplier_path

    expect(page).to have_select('Nombre del banco del proveedor', with_options: ['Banco A', 'Banco B'])
  end
end
