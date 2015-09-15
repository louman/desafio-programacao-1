require 'rails_helper'

RSpec.describe Order do

  include_examples 'valid_factory', :order

  include_examples 'valid_associations', {
    have_many: [:order_items]
  }

  context 'validations' do
    include_examples 'required_attributes', :order, [
      :total, :customer_name, :merchant_address, :merchant_name
    ]
  end
  
end
