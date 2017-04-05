json.extract! purchase, :id, :ticket_quantity, :payment_amount, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
