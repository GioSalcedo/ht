# app/controllers/banks_controller.rb
class BanksController < ApplicationController
  before_action :set_bank, %i[:show :edit :update :destroy]

  def index
    @banks = Bank.all
  end

  def show; end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      redirect_to banks_path, notice: t('.created_successfully')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @bank.update(bank_params)
      redirect_to banks_path, notice: t('.updated_successfully')
    else
      render :edit
    end
  end

  def destroy
    @bank.destroy
    redirect_to banks_path, notice: t('.destroyed_successfully')
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name)
  end
end