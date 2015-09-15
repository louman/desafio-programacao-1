class Upload < ActiveRecord::Base

  belongs_to :user
  has_many :orders

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: ['application/octet-stream', 'text/plain']
  validates_attachment_file_name :attachment, matches: [/tab\Z/]

  def orders_total
    orders.inject(0) { |sum, order| order.total + sum }
  end

end
