# == Schema Information
#
# Table name: suppliers
#
#  id             :bigint           not null, primary key
#  account_number :string
#  contact_person :string
#  name           :string
#  nit            :string
#  phone_number   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bank_id        :bigint           not null
#
# Indexes
#
#  index_suppliers_on_bank_id  (bank_id)
#
# Foreign Keys
#
#  fk_rails_...  (bank_id => banks.id)
#
class Supplier < ApplicationRecord
  class Proveedor < ApplicationRecord
    belongs_to :bank
  
    validates :nombre, presence: true, length: { maximum: 50 }
    validates :nit, presence: true, format: { with: /\A\d{9}-\d?\z/ }
    validates :persona_contacto, presence: true
    validates :celular, length: { maximum: 10 }, allow_blank: true
    validates :banco, presence: true
    validates :numero_cuenta, length: { maximum: 15 }, allow_blank: true 
  end
end
