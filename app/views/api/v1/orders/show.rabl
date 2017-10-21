collection @order

attributes :id,
           :customer_id,
           :contact_id,
           :gross_total,
           :net_total,
           :taxincluded,
           :order_date,
           :delivery_date,
           :notes,
           :payment_id,
           :taxzone_id,
           :currency_id,
           :closed,
           :created_at,
           :updated_at

child :orderitems do
  attributes :id, :position, :product_id, :description, :net_price, :discount, :qty, :unit, :base_qty
end