class FileDataImporterService

  def initialize(data:, upload:)
    @data   = data
    @upload = upload
  end

  def import!
    @data.each do |row|
      create_order(row)
    end
  end

  private

  def create_order(row)
    order = Order.new(
      customer_name:    row['purchaser-name'],
      merchant_address: row['merchant-address'],
      merchant_name:    row['merchant-name'],
      upload_id:        @upload.id
    )
    order.order_items.build(
      description: row['item-description'],
      unit_price:  row['item-price'],
      quantity:    row['purchase-count']
    )
    order.total = order.order_items.first.total
    order.save!
  end

end