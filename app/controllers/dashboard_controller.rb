class DashboardController < ApplicationController
  def dashboard
    @banks = Bank.all
    @suppliers = Supplier.all
  end
end
