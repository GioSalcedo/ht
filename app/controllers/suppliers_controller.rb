class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]
  def index
    @suppliers = Supplier.all
  end

  def show; end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to @supplier, notice: 'supplier creado con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: 'supplier actualizado con éxito.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_url, notice: 'supplier eliminado con éxito.'
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:supplier_name, :nit, :contact_person, :phone_number, :bank_id, :account_number)
  end
end
